import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/src/util/animation_controller_utils.dart';

import '../widgets/draw_arc.dart';

const double _kGapAngle = math.pi / 12;
const double _kMinAngle = math.pi / 36;

class ThreeArchedCircle extends StatefulWidget {
  final double size;
  final Color color;

  const ThreeArchedCircle({
    Key? key,
    required this.color,
    required this.size,
  }) : super(key: key);

  @override
  State<ThreeArchedCircle> createState() => _ThreeArchedCircleState();
}

class _ThreeArchedCircleState extends State<ThreeArchedCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = widget.color;
    final double size = widget.size;
    final double ringWidth = size * 0.08;

    const Interval firstRotationInterval = Interval(
      0.0,
      0.5,
      curve: Curves.easeInOut,
    );

    const Interval firstArchInterval = Interval(
      0.0,
      0.4,
      curve: Curves.easeInOut,
    );

    const Interval secondRotationInterval = Interval(
      0.5,
      1.0,
      curve: Curves.easeInOut,
    );

    const Interval secondArchInterval = Interval(
      0.5,
      0.9,
      curve: Curves.easeInOut,
    );

    return Container(
      padding: EdgeInsets.all(size * 0.04),
      // color: Colors.green,
      width: size,
      height: size,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) {
          return _animationController.value <= 0.5
              ? Transform.rotate(
                  angle: _animationController.eval(
                    Tween<double>(begin: 0, end: 4 * math.pi / 3),
                    curve: firstRotationInterval,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Arc.draw(
                        color: color,
                        size: size,
                        strokeWidth: ringWidth,
                        startAngle: 7 * math.pi / 6,
                        endAngle: _animationController.eval(
                          Tween<double>(
                            begin: 2 * math.pi / 3 - _kGapAngle,
                            end: _kMinAngle,
                          ),
                          curve: firstArchInterval,
                        ),
                      ),
                      Arc.draw(
                        color: color,
                        size: size,
                        strokeWidth: ringWidth,
                        startAngle: math.pi / 2,
                        endAngle: _animationController.eval(
                          Tween<double>(
                            begin: 2 * math.pi / 3 - _kGapAngle,
                            end: _kMinAngle,
                          ),
                          curve: firstArchInterval,
                        ),
                      ),
                      Arc.draw(
                        color: color,
                        size: size,
                        strokeWidth: ringWidth,
                        startAngle: -math.pi / 6,
                        endAngle: _animationController.eval(
                          Tween<double>(
                            begin: 2 * math.pi / 3 - _kGapAngle,
                            end: _kMinAngle,
                          ),
                          curve: firstArchInterval,
                        ),
                      ),
                    ],
                  ),
                )
              : Transform.rotate(
                  angle: _animationController.eval(
                    Tween<double>(
                      begin: 4 * math.pi / 3,
                      end: (4 * math.pi / 3) + (2 * math.pi / 3),
                    ),
                    curve: secondRotationInterval,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Arc.draw(
                        color: color,
                        size: size,
                        strokeWidth: ringWidth,
                        startAngle: 7 * math.pi / 6,
                        endAngle: _animationController.eval(
                          Tween<double>(
                            begin: _kMinAngle,
                            end: 2 * math.pi / 3 - _kGapAngle,
                          ),
                          curve: secondArchInterval,
                        ),
                      ),
                      Arc.draw(
                        color: color,
                        size: size,
                        strokeWidth: ringWidth,
                        startAngle: math.pi / 2,
                        endAngle: _animationController.eval(
                          Tween<double>(
                            begin: _kMinAngle,
                            end: 2 * math.pi / 3 - _kGapAngle,
                          ),
                          curve: secondArchInterval,
                        ),
                      ),
                      Arc.draw(
                        color: color,
                        size: size,
                        strokeWidth: ringWidth,
                        startAngle: -math.pi / 6,
                        endAngle: _animationController.eval(
                          Tween<double>(
                            begin: _kMinAngle,
                            end: 2 * math.pi / 3 - _kGapAngle,
                          ),
                          curve: secondArchInterval,
                        ),
                      ),
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
