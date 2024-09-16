import 'package:flutter/material.dart';
import 'package:loading_animation_widget/src/util/animation_controller_utils.dart';
import '../widgets/draw_dot.dart';

class BuildDot extends StatelessWidget {
  final Color color;
  final double angle;
  final double size;
  final Interval interval;
  final AnimationController controller;
  final bool first;
  const BuildDot.first({
    Key? key,
    required this.color,
    required this.angle,
    required this.size,
    required this.interval,
    required this.controller,
  })  : first = true,
        super(key: key);

  const BuildDot.second({
    Key? key,
    required this.color,
    required this.angle,
    required this.size,
    required this.interval,
    required this.controller,
  })  : first = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Transform.translate(
        offset: Offset(0, -size / 2.4),
        child: UnconstrainedBox(
          child: DrawDot.circular(
            color: color,
            dotSize: controller.eval(
              Tween<double>(
                begin: first ? 0.0 : size / 6,
                end: first ? size / 6 : 0.0,
              ),
              curve: interval,
            )
          ),
        ),
      ),
    );
  }
}
