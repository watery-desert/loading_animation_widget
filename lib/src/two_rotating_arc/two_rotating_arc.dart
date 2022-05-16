import 'package:flutter/material.dart';
import '../widgets/draw_arc.dart';
import 'dart:math' as math;

class TwoRotatingArc extends StatefulWidget {
  final double size;
  final Color color;
  const TwoRotatingArc({
    Key? key,
    required this.color,
    required this.size,
  }) : super(key: key);

  @override
  _TwoRotatingArcState createState() => _TwoRotatingArcState();
}

class _TwoRotatingArcState extends State<TwoRotatingArc>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  final Cubic firstCurve = Curves.easeInQuart;
  final Cubic secondCurve = Curves.easeOutQuart;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final double size = widget.size;
    final double strokeWidth = size / 10;
    final Color color = widget.color;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, __) => Stack(
        children: <Widget>[
          Visibility(
            visible: _animationController.value <= 0.5,
            child: Transform.rotate(
              angle: Tween<double>(
                begin: 0.0,
                end: 3 * math.pi / 4,
              )
                  .animate(
                    CurvedAnimation(
                      parent: _animationController,
                      curve: Interval(
                        0.0,
                        0.5,
                        curve: firstCurve,
                      ),
                    ),
                  )
                  .value,
              child: Arc.draw(
                color: color,
                size: size,
                strokeWidth: strokeWidth,
                startAngle: -math.pi / 2,
                // endAngle: math.pi / (size * size),
                endAngle: Tween<double>(
                  begin: math.pi / (size * size),
                  end: -math.pi / 2,
                )
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Interval(
                          0.0,
                          0.5,
                          curve: firstCurve,
                        ),
                      ),
                    )
                    .value,
              ),
            ),
          ),
          Visibility(
            visible: _animationController.value >= 0.5,
            child: Transform.rotate(
              angle: Tween<double>(
                begin: math.pi / 4,
                end: math.pi,
              )
                  .animate(
                    CurvedAnimation(
                      parent: _animationController,
                      curve: Interval(
                        0.5,
                        1.0,
                        curve: secondCurve,
                      ),
                    ),
                  )
                  .value,
              child: Arc.draw(
                color: color,
                size: size,
                strokeWidth: strokeWidth,
                startAngle: -math.pi / 2,
                // endAngle: math.pi / (size * size),
                endAngle: Tween<double>(
                  begin: math.pi / 2,
                  end: math.pi / (size * size),
                )
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Interval(
                          0.5,
                          1.0,
                          curve: secondCurve,
                        ),
                      ),
                    )
                    .value,
              ),
            ),
          ),

          ///
          ///second one
          ///
          ///
          Visibility(
            visible: _animationController.value <= 0.5,
            child: Transform.rotate(
              angle: Tween<double>(begin: -math.pi, end: -math.pi / 4)
                  .animate(
                    CurvedAnimation(
                      parent: _animationController,
                      curve: Interval(0.0, 0.5, curve: firstCurve),
                    ),
                  )
                  .value,
              child: Arc.draw(
                color: color,
                size: size,
                strokeWidth: strokeWidth,
                startAngle: -math.pi / 2,
                // endAngle: math.pi / (size * size),
                endAngle: Tween<double>(
                  begin: math.pi / (size * size),
                  end: -math.pi / 2,
                )
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Interval(
                          0.0,
                          0.5,
                          curve: firstCurve,
                        ),
                      ),
                    )
                    .value,
              ),
            ),
          ),
          Visibility(
            visible: _animationController.value >= 0.5,
            child: Transform.rotate(
              angle: Tween<double>(
                begin: -3 * math.pi / 4,
                end: 0.0,
              )
                  .animate(
                    CurvedAnimation(
                      parent: _animationController,
                      curve: Interval(
                        0.5,
                        1.0,
                        curve: secondCurve,
                      ),
                    ),
                  )
                  .value,
              child: Arc.draw(
                color: color,
                size: size,
                strokeWidth: strokeWidth,
                startAngle: -math.pi / 2,
                // endAngle: math.pi / (size * size),
                endAngle: Tween<double>(
                  begin: math.pi / 2,
                  end: math.pi / (size * size),
                )
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Interval(
                          0.5,
                          1.0,
                          curve: secondCurve,
                        ),
                      ),
                    )
                    .value,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
