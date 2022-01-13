import 'package:flutter/material.dart';
import '../widgets/draw_dot.dart';
import 'swivel_dot.dart';

class NewtonCradle extends StatefulWidget {
  final double size;
  final Color color;

  const NewtonCradle({
    Key? key,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  State<NewtonCradle> createState() => _NewtonCradleState();
}

class _NewtonCradleState extends State<NewtonCradle>
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
    final double dotSize = widget.size / 10;
    final Offset rotationOrigin = Offset(0, -widget.size / 2);
    final Color color = widget.color;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, __) => SizedBox(
        width: widget.size,
        height: widget.size,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SwivelDot.left(
              color: color,
              controller: _animationController,
              dotSize: dotSize,
              rotationOrigin: rotationOrigin,
              firstInterval: 0.0,
              secondInterval: 0.20,
              thirdInterval: 0.30,
              fourthInterval: 0.50,
            ),
            DrawDot.circular(
              dotSize: dotSize,
              color: color,
            ),
            DrawDot.circular(
              dotSize: dotSize,
              color: color,
            ),
            SwivelDot.right(
              color: color,
              controller: _animationController,
              dotSize: dotSize,
              rotationOrigin: rotationOrigin,
              firstInterval: 0.50,
              secondInterval: 0.70,
              thirdInterval: 0.80,
              fourthInterval: 1.0,
            ),
          ],
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
