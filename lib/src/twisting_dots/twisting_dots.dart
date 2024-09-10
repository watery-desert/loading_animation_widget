import 'package:flutter/material.dart';
import 'package:loading_animation_widget/src/util/animation_controller_utils.dart';
import '../widgets/draw_dot.dart';
import 'dart:math' as math;

class TwistingDots extends StatefulWidget {
  final double size;
  final Color leftDotColor;
  final Color rightDotColor;

  const TwistingDots({
    Key? key,
    required this.size,
    required this.leftDotColor,
    required this.rightDotColor,
  }) : super(key: key);

  @override
  _TwistingDotsState createState() => _TwistingDotsState();
}

class _TwistingDotsState extends State<TwistingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final double size = widget.size;
    final Color firstColor = widget.leftDotColor;
    final Color secondColor = widget.rightDotColor;
    final double dotSize = size / 3;

    return SizedBox(
      width: size,
      height: size,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) => Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Visibility(
              visible: _animationController.value < 0.5,
              child: Transform.rotate(
                angle: _animationController.evalDouble(
                  to: math.pi,
                  end: 0.5,
                  curve: Curves.elasticOut,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    DrawDot.circular(
                      dotSize: dotSize,
                      color: firstColor,
                    ),
                    DrawDot.circular(
                      dotSize: dotSize,
                      color: secondColor,
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: _animationController.value > 0.5,
              child: Transform.rotate(
                angle: _animationController.evalDouble(
                  from: -math.pi,
                  to: 0,
                  begin: 0.5,
                  curve: Curves.elasticOut,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    DrawDot.circular(
                      dotSize: dotSize,
                      color: firstColor,
                    ),
                    DrawDot.circular(
                      dotSize: dotSize,
                      color: secondColor,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
