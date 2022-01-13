import 'package:flutter/material.dart';
import '../widgets/draw_dot.dart';

class BouncingBall extends StatefulWidget {
  final double size;
  final Color color;

  const BouncingBall({
    Key? key,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  _BouncingBallState createState() => _BouncingBallState();
}

class _BouncingBallState extends State<BouncingBall>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final double size = widget.size;
    final Color color = widget.color;
    final double ballSize = size / 3;
    final double radiusDisplacement = ballSize * 0.08;
    return SizedBox(
      width: size,
      height: size,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) {
          return Stack(
            children: <Widget>[
              Visibility(
                visible: _animationController.value <= 0.4,
                child: Transform.translate(
                  offset: Tween<Offset>(
                    begin: Offset.zero,
                    end: Offset(0, size - ballSize),
                  )
                      .animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: const Interval(
                            0.0,
                            0.4,
                            curve: Curves.easeIn,
                          ),
                        ),
                      )
                      .value,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: DrawDot.circular(
                      color: color,
                      dotSize: ballSize,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: _animationController.value >= 0.4 &&
                    _animationController.value <= 0.45,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: DrawDot.elliptical(
                    color: color,
                    width: Tween<double>(
                      begin: ballSize,
                      end: ballSize + radiusDisplacement,
                    )
                        .animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: const Interval(
                              0.4,
                              0.45,
                            ),
                          ),
                        )
                        .value,
                    height: Tween<double>(
                      begin: ballSize,
                      end: ballSize - radiusDisplacement,
                    )
                        .animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: const Interval(
                              0.4,
                              0.45,
                            ),
                          ),
                        )
                        .value,
                  ),
                ),
              ),
              Visibility(
                visible: _animationController.value >= 0.45 &&
                    _animationController.value <= 0.5,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: DrawDot.elliptical(
                    color: color,
                    width: Tween<double>(
                      begin: ballSize + radiusDisplacement,
                      end: ballSize,
                    )
                        .animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: const Interval(
                              0.45,
                              0.5,
                            ),
                          ),
                        )
                        .value,
                    height: Tween<double>(
                      begin: ballSize - radiusDisplacement,
                      end: ballSize,
                    )
                        .animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: const Interval(
                              0.45,
                              0.5,
                            ),
                          ),
                        )
                        .value,
                  ),
                ),
              ),
              Visibility(
                visible: _animationController.value >= 0.5,
                child: Transform.translate(
                  offset: Tween<Offset>(
                    begin: Offset(0, size - ballSize),
                    end: Offset.zero,
                  )
                      .animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: const Interval(
                            0.5,
                            1.0,
                            curve: Curves.easeOutQuad,
                          ),
                        ),
                      )
                      .value,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: DrawDot.circular(
                      color: color,
                      dotSize: ballSize,
                    ),
                  ),
                ),
              ),
            ],
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
