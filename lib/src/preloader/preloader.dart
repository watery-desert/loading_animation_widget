import 'package:flutter/material.dart';
import '../widgets/circular_dot.dart';
import 'dart:math' as math;

class Preloader extends StatefulWidget {
  final double size;
  final List<Color> colors;
  final int time;

  const Preloader({
    Key? key,
    required this.size,
    required this.colors,
    this.time = 3000,
  }) : super(key: key);

  @override
  _PreloaderState createState() => _PreloaderState();
}

class _PreloaderState extends State<Preloader>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.time),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final double size = widget.size;
    final Color firstColor = widget.colors[0];
    final Color secondColor = widget.colors[1];

    final dotSize = size / 3;
    return Container(
      width: size,
      height: size,
      // color: Color(0xFF1C1941),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) => Stack(
          fit: StackFit.expand,
          children: [
            Visibility(
              visible: _animationController.value < 0.5,
              child: Transform.rotate(
                angle: Tween<double>(
                  begin: 0,
                  end: math.pi,
                )
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Interval(
                          0.0,
                          0.5,
                          curve: Curves.elasticOut,
                        ),
                      ),
                    )
                    .value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircularDot(
                      dotSize: dotSize,
                      color: firstColor,
                    ),
                    CircularDot(
                      dotSize: dotSize,
                      color: secondColor,
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: _animationController.value > 0.5,
              child: Transform.rotate(
                angle: Tween<double>(
                  begin: -math.pi,
                  end: 0,
                )
                    .animate(
                      CurvedAnimation(
                          parent: _animationController,
                          curve: Interval(
                            0.5,
                            1.0,
                            curve: Curves.elasticOut,
                          )),
                    )
                    .value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircularDot(
                      dotSize: dotSize,
                      color: firstColor,
                    ),
                    CircularDot(
                      dotSize: dotSize,
                      color: secondColor,
                    ),
                  ],
                ),
              ),
            )
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
