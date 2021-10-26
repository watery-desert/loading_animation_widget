import 'package:flutter/material.dart';

class CircularDot extends StatelessWidget {
  final double dotSize;
  final Color color;
  const CircularDot({
    Key? key,
    required this.dotSize,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dotSize,
      height: dotSize,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}