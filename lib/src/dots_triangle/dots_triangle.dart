import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'build_sides.dart';

class DotsTriangle extends StatefulWidget {
  final double size;
  final Color color;
  const DotsTriangle({
    Key? key,
    required this.color,
    required this.size,
  }) : super(key: key);

  @override
  _DotsTriangleState createState() => _DotsTriangleState();
}

class _DotsTriangleState extends State<DotsTriangle>
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
    final Color color = widget.color;
    final double size = widget.size;
    final double dotDepth = size / 8;
    final double dotLength = size / 2;

    const Interval interval = Interval(0.0, 0.8);

    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, __) => SizedBox(
        width: size,
        height: size,
        child: Center(
          child: SizedBox(
            width: size,
            height: 0.884 * size,
            child: Stack(
              // fit: StackFit.expand,
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Transform.translate(
                    offset: Offset((size - dotDepth) / 2, 0),
                    child: BuildSides.forward(
                      rotationAngle: 2 * math.pi / 3,
                      // rotationAngle: math.pi / 2,
                      rotationOrigin: Offset(-(size - dotDepth) / 2, 0),
                      maxLength: dotLength,
                      depth: dotDepth,
                      color: color,
                      controller: _animationController,
                      interval: interval,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: BuildSides.reverse(
                    rotationAngle: math.pi / 3,
                    // rotationAngle: math.pi / 2,
                    rotationOrigin: Offset((size - dotDepth) / 2, 0),
                    maxLength: dotLength,
                    depth: dotDepth,
                    color: color,
                    controller: _animationController,
                    interval: interval,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: BuildSides.forward(
                    maxLength: dotLength,
                    depth: dotDepth,
                    color: color,
                    controller: _animationController,
                    interval: interval,
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
