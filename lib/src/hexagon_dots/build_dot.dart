import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as math;
import '../widgets/circular_dot.dart';

class BuildDot extends StatelessWidget {
  final Color color;
  final double angle;
  final double size;
  final double dotSize;
  const BuildDot({
    required this.color,
    required this.angle,
    required this.size,
    required this.dotSize,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: math.radians(angle),
      child: Transform.translate(
        offset: Offset(size / 2.4, 0),
        child: UnconstrainedBox(
          child: CircularDot(
            color: color,
            dotSize: dotSize,
          ),
        ),
      ),
    );
  }
}
