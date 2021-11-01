import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as math;
import 'dart:math' as math2;
import 'build_dot.dart';

class HexagonDots extends StatefulWidget {
  final double size;
  final Color color;
  final int time;
  const HexagonDots({
    required this.size,
    required this.color,
    required this.time,
  });

  @override
  _BuildSpinnerState createState() => _BuildSpinnerState();
}

class _BuildSpinnerState extends State<HexagonDots>
    with TickerProviderStateMixin {
  late AnimationController _sizeController;
  late AnimationController _rotationController;

  late Animation<double> _rotationAnimation;
  bool showBottom = true;

  @override
  void initState() {
    super.initState();

    final int sizeDuration = (widget.time ~/ 4);

    _sizeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: sizeDuration),
    );

    _rotationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.time),
    );

    _rotationAnimation =
        Tween<double>(begin: 0.0, end: 360).animate(_rotationController);

    _sizeController.forward();

    _sizeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          showBottom = false;
        });
        _rotationController.forward(from: 0.0);
      }
    });

    _rotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          showBottom = true;
        });
        _sizeController.forward(from: 0.0);
      }
    });
  }

  Widget _buildInitialDot(double angle, Interval interval) {
    return BuildDot(
      size: widget.size,
      color: widget.color,
      angle: angle,
      dotSize: Tween<double>(begin: 0.0, end: widget.size / 6)
          .animate(
            CurvedAnimation(
              parent: _sizeController,
              curve: interval,
            ),
          )
          .value,
    );
  }

  Widget _buildLaterDot(double angle, Interval interval) {
    return BuildDot(
      size: widget.size,
      color: widget.color,
      angle: angle,
      dotSize: Tween<double>(begin: widget.size / 6, end: 0.0)
          .animate(
            CurvedAnimation(
              parent: _rotationController,
              curve: interval,
            ),
          )
          .value,
    );
  }

  @override
  Widget build(BuildContext context) {
    final angle60 = math2.pi / 3;
    final angle120 = 2 * math2.pi / 3;
    final angle180 = math2.pi;
    final angle240 = 4 * math2.pi / 3;
    final angle300 = 5 * math2.pi / 3;

    return Center(
      child: showBottom
          ? AnimatedBuilder(
              animation: _sizeController,
              builder: (_, __) => Container(
                width: widget.size,
                height: widget.size,
                // color: Colors.brown,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    _buildInitialDot(0, Interval(0, 0.35)),
                    _buildInitialDot(60, Interval(0.15, 0.5)),
                    _buildInitialDot(120, Interval(0.25, 0.6)),
                    _buildInitialDot(180, Interval(0.35, 0.7)),
                    _buildInitialDot(240, Interval(0.45, 0.8)),
                    _buildInitialDot(300, Interval(0.55, 0.9)),
                  ],
                ),
              ),
            )
          : AnimatedBuilder(
              animation: _rotationController,
              builder: (_, __) => Transform.rotate(
                angle: math.radians(_rotationAnimation.value),
                child: Container(
                  // color: Colors.brown,
                  width: widget.size,
                  height: widget.size,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      _buildLaterDot(0, Interval(0.85, 0.90)),
                      _buildLaterDot(60, Interval(0.80, 0.85)),
                      _buildLaterDot(120, Interval(0.75, 0.80)),
                      _buildLaterDot(180, Interval(0.70, 0.75)),
                      _buildLaterDot(240, Interval(0.65, 0.70)),
                      _buildLaterDot(300, Interval(0.60, 0.65)),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  @override
  void dispose() {
    _sizeController.dispose();
    _rotationController.dispose();
    super.dispose();
  }
}
