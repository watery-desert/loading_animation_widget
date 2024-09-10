import 'package:flutter/material.dart';
import 'package:loading_animation_widget/src/util/animation_controller_utils.dart';
import '../widgets/draw_arc.dart';
import 'dart:math' as math;

class DiscreteCircle extends StatefulWidget {
  final double size;
  final Color color;
  final Color secondCircleColor;
  final Color thirdCircleColor;
  const DiscreteCircle({
    Key? key,
    required this.color,
    required this.size,
    required this.secondCircleColor,
    required this.thirdCircleColor,
  }) : super(key: key);

  @override
  State<DiscreteCircle> createState() => _DiscreteCircleState();
}

class _DiscreteCircleState extends State<DiscreteCircle>
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
    final double strokeWidth = size / 8;
    final Color secondRingColor = widget.secondCircleColor;
    final Color thirdRingColor = widget.thirdCircleColor;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, __) {
        return Stack(
          children: <Widget>[
            Transform.rotate(
              angle: _animationController.evalDouble(
                to: 2 * math.pi,
                begin: 0.68,
                end: 0.95,
                curve: Curves.easeOut,
              ),
              child: Visibility(
                visible: _animationController.value >= 0.5,
                child: Arc.draw(
                  color: thirdRingColor,
                  size: size,
                  strokeWidth: strokeWidth,
                  startAngle: -math.pi / 2,
                  endAngle: _animationController.evalDouble(
                    from: math.pi / 2,
                    to: math.pi / (size * size),
                    begin: 0.7,
                    end: 0.95,
                    curve: Curves.easeOutSine,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _animationController.value >= 0.5,
              child: Arc.draw(
                color: secondRingColor,
                size: size,
                strokeWidth: strokeWidth,
                startAngle: -math.pi / 2,
                endAngle: _animationController.evalDouble(
                  from: -2 * math.pi,
                  to: math.pi / (size * size),
                  begin: 0.6,
                  end: 0.95,
                  curve: Curves.easeOutSine,
                ),
              ),
            ),
            Visibility(
              visible: _animationController.value <= 0.5,
              // visible: true,
              child: Transform.rotate(
                angle: _animationController.evalDouble(
                  to: math.pi * 0.06,
                  begin: 0.48,
                  end: 0.5,
                ),
                child: Arc.draw(
                  color: color,
                  size: size,
                  strokeWidth: strokeWidth,
                  startAngle: -math.pi / 2,
                  endAngle: _animationController.evalDouble(
                    from: math.pi / (size * size),
                    to: 1.94 * math.pi,
                    begin: 0.05,
                    end: 0.48,
                    curve: Curves.easeOutSine,
                  ),
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
                endAngle: _animationController.evalDouble(
                  from: -1.94 * math.pi,
                  to: math.pi / (size * size),
                  begin: 0.5,
                  end: 0.95,
                  curve: Curves.easeOutSine,
                ),
              ),
            ),
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
