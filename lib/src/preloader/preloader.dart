import 'package:flutter/material.dart';
import '../widgets/draw_dot.dart';
import 'dart:math' as math;

class Preloader extends StatefulWidget {
  final double size;
  final Color leftDotColor;
  final Color rightDotColor;
  final int time;

  const Preloader({
    Key? key,
    required this.size,
    required this.leftDotColor,
    required this.rightDotColor,
    required this.time,
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
    final Color firstColor = widget.leftDotColor;
    final Color secondColor = widget.rightDotColor;
    final double dotSize = size / 3;

    return SizedBox(
      width: size,
      height: size,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) => Stack(
          fit: StackFit.expand,
          children: <Widget> [
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
                        curve: const Interval(
                          0.0,
                          0.5,
                          curve: Curves.elasticOut,
                        ),
                      ),
                    )
                    .value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget> [
                    DrawDot.circular(
                      dotSize: dotSize,
                      color: firstColor,
                    ),
                    DrawDot.circular(
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
                        curve: const Interval(
                          0.5,
                          1.0,
                          curve: Curves.elasticOut,
                        ),
                      ),
                    )
                    .value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    DrawDot.circular(
                      dotSize: dotSize,
                      color: firstColor,
                    ),
                    DrawDot.circular(
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
