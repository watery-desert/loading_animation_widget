import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'build_dot.dart';

class HexagonDots extends StatefulWidget {
  final double size;
  final Color color;

  const HexagonDots({
    Key? key,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  _BuildSpinnerState createState() => _BuildSpinnerState();
}

class _BuildSpinnerState extends State<HexagonDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat();

    _rotationAnimation = Tween<double>(begin: 0, end: 3 * math.pi / 2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.3,
          1.0,
        ),
      ),
    );
  }

  Widget _buildInitialDot(double angle, Interval interval) => BuildDot.first(
        size: widget.size,
        color: widget.color,
        angle: angle,
        controller: _animationController,
        interval: interval,
      );

  Widget _buildLaterDot(double angle, Interval interval) => BuildDot.second(
        size: widget.size,
        color: widget.color,
        angle: angle,
        controller: _animationController,
        interval: interval,
      );

  @override
  Widget build(BuildContext context) {
    const double angle30 = math.pi / 6;
    const double angle60 = math.pi / 3;
    const double angle120 = 2 * math.pi / 3;
    const double angle180 = math.pi;
    const double angle240 = 4 * math.pi / 3;
    const double angle300 = 5 * math.pi / 3;

    return Center(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) => SizedBox(
          width: widget.size,
          height: widget.size,
          child: _animationController.value <= 0.28
              ? Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    _buildInitialDot(0 + angle30, const Interval(0, 0.08)),
                    _buildInitialDot(
                        angle60 + angle30, const Interval(0.04, 0.12)),
                    _buildInitialDot(
                        angle120 + angle30, const Interval(0.08, 0.16)),
                    _buildInitialDot(
                        angle180 + angle30, const Interval(0.12, 0.20)),
                    _buildInitialDot(
                        angle240 + angle30, const Interval(0.16, 0.24)),
                    _buildInitialDot(
                        angle300 + angle30, const Interval(0.20, 0.28)),
                  ],
                )
              : Transform.rotate(
                  angle: _rotationAnimation.value,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      _buildLaterDot(
                        0 + angle30,
                        const Interval(
                          0.80,
                          0.88,
                        ),
                      ),
                      _buildLaterDot(
                        angle60 + angle30,
                        const Interval(
                          0.76,
                          0.84,
                        ),
                      ),
                      _buildLaterDot(
                        angle120 + angle30,
                        const Interval(
                          0.72,
                          0.80,
                        ),
                      ),
                      _buildLaterDot(
                        angle180 + angle30,
                        const Interval(
                          0.68,
                          0.76,
                        ),
                      ),
                      _buildLaterDot(
                        angle240 + angle30,
                        const Interval(
                          0.64,
                          0.72,
                        ),
                      ),
                      _buildLaterDot(
                        angle300 + angle30,
                        const Interval(
                          0.60,
                          0.68,
                        ),
                      ),
                    ],
                  ),
                ),
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
