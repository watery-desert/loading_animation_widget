import 'package:flutter/material.dart';
import '../widgets/draw_arc.dart';
import 'dart:math' as math;

class DiscreteCircular extends StatefulWidget {
  final double size;
  final Color color;
  final int duration;
  const DiscreteCircular({
    Key? key,
    required this.color,
    required this.size,
    this.duration = 2000,
  }) : super(key: key);

  @override
  State<DiscreteCircular> createState() => _DiscreteCircularState();
}

class _DiscreteCircularState extends State<DiscreteCircular>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final testValue = 0.48;
    final Color color = widget.color;
    final double size = widget.size;
    final double strokeWidth = size / 8;
    // const Cubic curve = Curves.easeInQuad;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Stack(
          children: [
            Transform.rotate(
              angle: Tween<double>(begin: 0, end: 2 * math.pi)
                  .animate(
                    CurvedAnimation(
                      parent: _animationController,
                      curve: const Interval(
                        0.68,
                        0.95,
                        // curve: Curves.easeOut,
                      ),
                    ),
                  )
                  .value,
              child: Visibility(
                visible: _animationController.value >= 0.5,
                child: Arc.draw(
                  color: Colors.orange,
                  size: size,
                  strokeWidth: strokeWidth,
                  startAngle: -math.pi / 2,
                  // endAngle: math.pi / 2,
                  endAngle: Tween<double>(
                    begin: math.pi / 2,
                    end: math.pi / (size * size),
                  )
                      .animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: const Interval(
                            0.7,
                            0.95,
                            // curve: Curves.easeOut,
                          ),
                        ),
                      )
                      .value,
                ),
              ),
            ),
            Visibility(
              visible: _animationController.value >= 0.5,
              child: Arc.draw(
                color: Colors.teal,
                size: size,
                strokeWidth: strokeWidth,
                startAngle: -math.pi / 2,
                // endAngle: -math.pi
                endAngle: Tween<double>(
                  begin: -2 * math.pi,
                  end: math.pi / (size * size),
                )
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: const Interval(
                          0.6,
                          0.95,
                          curve: Curves.easeOutSine,
                        ),
                      ),
                    )
                    .value,
              ),
            ),

            Visibility(
              visible: _animationController.value <= 0.5,
              // visible: true,
              child: Transform.rotate(
                angle: Tween<double>(begin: 0, end: math.pi * 0.06)
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Interval(
                          testValue,
                          0.5,
                        ),
                      ),
                    )
                    .value,
                child: Arc.draw(
                  color: color,
                  size: size,
                  strokeWidth: strokeWidth,
                  startAngle: -math.pi / 2,
                  // endAngle: 1.94 * math.pi,
                  endAngle: Tween<double>(
                          begin: math.pi / (size * size), end: 1.94 * math.pi)
                      .animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: Interval(
                            0.05,
                            testValue,
                            curve: Curves.easeOutSine,
                          ),
                        ),
                      )
                      .value,
                ),
              ),
            ),
            Visibility(
              visible: _animationController.value >= 0.5,
              child: Arc.draw(
                color: color,
                size: size,
                strokeWidth: strokeWidth,
                startAngle: -math.pi / 2,
                // endAngle: -1.94 * math.pi
                endAngle: Tween<double>(
                  // begin: -2 * math.pi,
                  begin: -1.94 * math.pi,
                  end: math.pi / (size * size),
                )
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: const Interval(
                          0.5,
                          0.95,
                          curve: Curves.easeOutSine,
                        ),
                      ),
                    )
                    .value,
              ),
            ),
            // Arc.draw(
            //   color: Colors.black.withOpacity(0.1),
            //   size: size,
            //   strokeWidth: strokeWidth,
            //   startAngle: -math.pi / 2,
            //   endAngle: math.pi / (size * size),
            // ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
