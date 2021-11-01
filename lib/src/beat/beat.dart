import 'package:flutter/material.dart';
import '../beat/draw_ring.dart';

class Beat extends StatefulWidget {
  final double size;
  final Color color;
  final int time;

  const Beat({
    Key? key,
    required this.color,
    required this.size,
    required this.time,
  }) : 
  assert (time > 0, 'Duration must greater than 0'),
  super(key: key);

  @override
  _BeatState createState() => _BeatState();
}

class _BeatState extends State<Beat> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: widget.time,
      ),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.size;
    final color = widget.color;
    return SizedBox(
      width: size,
      height: size,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) => Stack(
          alignment: Alignment.center,
          children: [
            Visibility(
              visible: _animationController.value <= 0.7,
              child: Transform.scale(
                scale: Tween(begin: 0.15, end: 1.0)
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Interval(0.0, 0.7, curve: Curves.easeInCubic),
                      ),
                    )
                    .value,
                child: Opacity(
                  opacity: Tween(begin: 0.0, end: 1.0)
                      .animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: Interval(0.0, 0.2),
                        ),
                      )
                      .value,
                  child: Ring.draw(
                    rippleColor: color,
                    size: size,
                    strokeWidth: Tween(begin: size / 5, end: size / 8)
                        .animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: Interval(0.0, 0.7),
                          ),
                        )
                        .value,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _animationController.value <= 0.7,
              child: Ring.draw(
                rippleColor: color,
                size: size,
                strokeWidth: size / 8,
              ),
            ),
            Visibility(
              visible: _animationController.value <= 0.8 &&
                  _animationController.value >= 0.7,
              child: Transform.scale(
                scale: Tween(begin: 1.0, end: 1.15)
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Interval(0.7, 0.8),
                      ),
                    )
                    .value,
                child: Ring.draw(
                  rippleColor: color,
                  size: size,
                  strokeWidth: size / 8,
                ),
              ),
            ),
            Visibility(
              visible: _animationController.value >= 0.8,
              child: Transform.scale(
                scale: Tween(begin: 1.15, end: 1.0)
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Interval(0.8, 0.9),
                      ),
                    )
                    .value,
                child: Ring.draw(
                  rippleColor: color,
                  size: size,
                  strokeWidth: size / 8,
                ),
              ),
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
