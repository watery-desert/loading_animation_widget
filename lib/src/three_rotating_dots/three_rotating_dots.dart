import 'package:flutter/material.dart';
import '../widgets/draw_dot.dart';
import 'dart:math' as math;

class ThreeRotatingDots extends StatefulWidget {
  final double size;
  final Color color;

  const ThreeRotatingDots({
    Key? key,
    required this.color,
    required this.size,
  }) : super(key: key);

  @override
  _ThreeRotatingDotsState createState() => _ThreeRotatingDotsState();
}

class _ThreeRotatingDotsState extends State<ThreeRotatingDots>
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
    final double dotSize = size / 3;
    final double edgeOffset = (size - dotSize) / 2;

    const Interval firstDotsInterval = Interval(
      0.0,
      0.50,
      curve: Curves.easeInOutCubic,
    );
    const Interval secondDotsInterval = Interval(
      0.50,
      1.0,
      curve: Curves.easeInOutCubic,
    );

    return SizedBox(
      width: size,
      height: size,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) => Transform.translate(
          offset: Offset(0, size / 12),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _BuildDot.first(
                color: color,
                size: dotSize,
                controller: _animationController,
                dotOffset: edgeOffset,
                beginAngle: math.pi,
                endAngle: 0,
                interval: firstDotsInterval,
              ),

              _BuildDot.first(
                color: color,
                size: dotSize,
                controller: _animationController,
                dotOffset: edgeOffset,
                beginAngle: 5 * math.pi / 3,
                endAngle: 2 * math.pi / 3,
                interval: firstDotsInterval,
              ),

              _BuildDot.first(
                color: color,
                size: dotSize,
                controller: _animationController,
                dotOffset: edgeOffset,
                beginAngle: 7 * math.pi / 3,
                endAngle: 4 * math.pi / 3,
                interval: firstDotsInterval,
              ),

              /// Next 3 dots

              _BuildDot.second(
                controller: _animationController,
                beginAngle: 0,
                endAngle: -math.pi,
                interval: secondDotsInterval,
                dotOffset: edgeOffset,
                color: color,
                size: dotSize,
              ),

              _BuildDot.second(
                controller: _animationController,
                beginAngle: 2 * math.pi / 3,
                endAngle: -math.pi / 3,
                interval: secondDotsInterval,
                dotOffset: edgeOffset,
                color: color,
                size: dotSize,
              ),

              _BuildDot.second(
                controller: _animationController,
                beginAngle: 4 * math.pi / 3,
                endAngle: math.pi / 3,
                interval: secondDotsInterval,
                dotOffset: edgeOffset,
                color: color,
                size: dotSize,
              ),
            ],
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

class _BuildDot extends StatelessWidget {
  final AnimationController controller;
  final double beginAngle;
  final double endAngle;
  final Interval interval;
  final double dotOffset;
  final Color color;
  final double size;
  final bool first;

  const _BuildDot.first({
    Key? key,
    required this.controller,
    required this.beginAngle,
    required this.endAngle,
    required this.interval,
    required this.dotOffset,
    required this.color,
    required this.size,
  })  : first = true,
        super(key: key);

  const _BuildDot.second({
    Key? key,
    required this.controller,
    required this.beginAngle,
    required this.endAngle,
    required this.interval,
    required this.dotOffset,
    required this.color,
    required this.size,
  })  : first = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: first
          ? controller.value <= interval.end
          : controller.value >= interval.begin,
      child: Transform.rotate(
        angle: Tween<double>(
          begin: beginAngle,
          end: endAngle,
        )
            .animate(
              CurvedAnimation(parent: controller, curve: interval),
            )
            .value,
        child: Transform.translate(
          offset: Tween<Offset>(
            begin: first ? Offset.zero : Offset(0, -dotOffset),
            end: first ? Offset(0, -dotOffset) : Offset.zero,
          )
              .animate(
                CurvedAnimation(
                  parent: controller,
                  curve: interval,
                ),
              )
              .value,
          child: DrawDot.circular(
            color: color,
            dotSize: size,
          ),
        ),
      ),
    );
  }
}
