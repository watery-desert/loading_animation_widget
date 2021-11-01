import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../widgets/draw_arc.dart';

class InkDrop extends StatefulWidget {
  final double size;
  final Color color;
  final Color ringColor;
  const InkDrop({
    Key? key,
    required this.size,
    required this.color,
    this.ringColor = const Color(0x1A000000),
  }) : super(key: key);

  @override
  _InkDropState createState() => _InkDropState();
}

class _InkDropState extends State<InkDrop> with SingleTickerProviderStateMixin {
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
    final size = widget.size;
    final color = widget.color;
    final ringColor = widget.ringColor;
    final strokeWidth = size / 5;
    return SizedBox(
      // alignment: Alignment.center,
      // color: Colors.green,
      width: size,
      height: size,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) => Stack(
          alignment: Alignment.center,
          children: [
            Arc.draw(
              strokeWidth: strokeWidth,
              size: size,
              color: ringColor,
              startAngle: math.pi / 2,
              endAngle: 2 * math.pi,
            ),
            Visibility(
              visible: _animationController.value <= 0.9,
              child: Transform.translate(
                offset: Tween(
                  begin: Offset(0, -size),
                  end: Offset(0, 0),
                )
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Interval(0.05, 0.4, curve: Curves.easeInCubic),
                      ),
                    )
                    .value,
                child: Arc.draw(
                  strokeWidth: strokeWidth,
                  size: size,
                  color: color,
                  startAngle: -3 * math.pi / 2,
                  // endAngle: math.pi / (size * size),
                  endAngle:
                      Tween(begin: math.pi / (size * size), end: math.pi / 1.13)
                          .animate(
                            CurvedAnimation(
                              parent: _animationController,
                              curve: Interval(0.38, 0.9),
                            ),
                          )
                          .value,
                ),
              ),
            ),
            Visibility(
              visible: _animationController.value <= 0.9,
              child: Transform.translate(
                offset: Tween(
                  begin: Offset(0, -size),
                  end: Offset(0, 0),
                )
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Interval(0.05, 0.4, curve: Curves.easeInCubic),
                      ),
                    )
                    .value,
                child: Arc.draw(
                  strokeWidth: strokeWidth,
                  size: size,
                  color: color,
                  startAngle: -3 * math.pi / 2,
                  endAngle: Tween(
                    begin: math.pi / (size * size),
                    end: -math.pi / 1.13,
                  )
                      .animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: Interval(0.38, 0.9),
                        ),
                      )
                      .value,
                ),
              ),
            ),

            /// Right
            Visibility(
              visible: _animationController.value >= 0.9,
              child: Arc.draw(
                strokeWidth: strokeWidth,
                size: size,
                color: color,
                startAngle: -math.pi / 4,
                endAngle: Tween(
                  begin: -math.pi / 7.4,
                  end: -math.pi / 4,
                )
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Interval(0.9, 0.96),
                      ),
                    )
                    .value,
              ),
            ),
            // Left
            Visibility(
              visible: _animationController.value >= 0.9,
              child: Arc.draw(
                strokeWidth: strokeWidth,
                size: size,
                color: color,
                startAngle: -3 * math.pi / 4,
                // endAngle: math.pi / 4
                // endAngle: math.pi / 7.4
                endAngle: Tween(
                  begin: math.pi / 7.4,
                  end: math.pi / 4,
                )
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Interval(0.9, 0.96),
                      ),
                    )
                    .value,
              ),
            ),

            /// Right
            Visibility(
              visible: _animationController.value >= 0.9,
              child: Arc.draw(
                strokeWidth: strokeWidth,
                size: size,
                color: color,
                startAngle: -math.pi / 3.5,
                // endAngle: math.pi / 28,
                endAngle: Tween(
                  begin: math.pi / 1.273,
                  end: math.pi / 28,
                )
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Interval(0.9, 1.0),
                      ),
                    )
                    .value,
              ),
            ),

            /// Left
            Visibility(
              visible: _animationController.value >= 0.9,
              child: Arc.draw(
                strokeWidth: strokeWidth,
                size: size,
                color: color,
                startAngle: math.pi / 0.778,
                // endAngle: -math.pi / 1.273
                // endAngle: -math.pi / 27

                endAngle: Tween(
                  begin: -math.pi / 1.273,
                  end: -math.pi / 27,
                )
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Interval(0.9, 1.0),
                      ),
                    )
                    .value,
              ),
            ),
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
