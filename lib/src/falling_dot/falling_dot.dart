import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/src/util/animation_controller_utils.dart';

import '../widgets/draw_arc.dart';
import '../widgets/draw_dot.dart';

class FallingDot extends StatefulWidget {
  final double size;
  final Color color;

  const FallingDot({
    Key? key,
    required this.color,
    required this.size,
  }) : super(key: key);

  @override
  _FallingDotState createState() => _FallingDotState();
}

class _FallingDotState extends State<FallingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final double startAngle = -math.pi / 4;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1500,
      ),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final double size = widget.size;
    final Color color = widget.color;
    const Cubic curve = Curves.easeInOutCubic;
    final double strokeWidth = size * 0.08;

    const double endAngle = 3 * math.pi / 2;
    final double innerBoxSize = size * 0.6;
    final double dotFinalSize = size * 0.15;
    // final double innerPadding = size * 0.05;

    // final double dotOffset =
    //     (innerBoxSize - innerBoxSize / 2 - innerPadding / 2);

    Color fallingFromTopDotColor() => _animationController.eval(
          ColorTween(begin: color.withOpacity(0.0), end: color),
          curve: const Interval(0.0, 0.2, curve: Curves.easeInOut),
        )!;

    double dotWidth() => _animationController.evalDouble(
          from: size * 0.01,
          to: dotFinalSize,
          begin: 0.15,
          end: 0.3,
          curve: Curves.easeInOut,
        );

    double dotHeight() => _animationController.evalDouble(
          from: size * 0.1,
          to: dotFinalSize,
          begin: 0.15,
          end: 0.3,
          curve: Curves.easeInOut,
        );

    return Container(
      width: size,
      height: size,
      // color: Colors.green,
      alignment: Alignment.center,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) {
          return SizedBox(
            height: innerBoxSize,
            width: innerBoxSize,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Visibility(
                  visible: _animationController.value <= 0.5,
                  child: Transform.rotate(
                    angle: _animationController.evalDouble(
                      from: -math.pi,
                      to: 0,
                      end: 0.3,
                      curve: curve,
                    ),
                    child: Arc.draw(
                      color: color,
                      size: size,
                      strokeWidth: strokeWidth,
                      startAngle: startAngle,
                      endAngle: endAngle,
                    ),
                  ),
                ),
                Visibility(
                  visible: _animationController.value >= 0.5,
                  child: Transform.rotate(
                    angle: _animationController.evalDouble(
                      to: math.pi,
                      begin: 0.5,
                      end: 0.8,
                      curve: curve,
                    ),
                    child: Arc.draw(
                      color: color,
                      size: size,
                      strokeWidth: strokeWidth,
                      startAngle: startAngle,
                      endAngle: endAngle,
                    ),
                  ),
                ),
                Visibility(
                  visible: _animationController.value <= 0.5,
                  child: Transform.translate(
                    offset: _animationController.eval(
                      Tween<Offset>(
                        begin: Offset(0, -size / 2),
                        end: Offset.zero,
                      ),
                      curve: const Interval(0.1, 0.3, curve: curve),
                    ),
                    child: DrawDot.elliptical(
                      width: dotWidth(),
                      height: dotHeight(),
                      color: fallingFromTopDotColor(),
                    ),
                  ),
                ),
                Visibility(
                  visible: _animationController.value >= 0.5,
                  child: Transform.translate(
                    offset: _animationController.eval(
                      Tween<Offset>(
                        begin: Offset.zero,
                        end: Offset(0, dotFinalSize),
                      ),
                      curve: const Interval(0.5, 0.72, curve: Curves.easeInOut),
                    ),
                    child: DrawDot.circular(
                      dotSize: _animationController.evalDouble(
                        from: dotFinalSize,
                        to: 0.0,
                        begin: 0.5,
                        end: 0.72,
                        curve: Curves.easeInOut,
                      ),
                      color: color,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
