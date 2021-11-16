import 'package:flutter/material.dart';
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
            dotSize: first
                ? Tween<double>(
                    begin: 0.0,
                    end: size / 6,
                  )
                    .animate(
                      CurvedAnimation(
                        parent: controller,
                        curve: interval,
                      ),
                    )
                    .value
                : Tween<double>(
                    begin: size / 6,
                    end: 0.0,
                  )
                    .animate(
                      CurvedAnimation(
                        parent: controller,
                        curve: interval,
                      ),
                    )
                    .value,
          ),
        ),
      ),
    );
  }
}
