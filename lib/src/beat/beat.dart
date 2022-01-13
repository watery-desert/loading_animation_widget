import 'package:flutter/material.dart';
import '../widgets/draw_ring.dart';

class Beat extends StatefulWidget {
  final double size;
  final Color color;

  const Beat({
    Key? key,
    required this.color,
    required this.size,
  }) : super(key: key);

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
      duration: const Duration(
        milliseconds: 1000,
      ),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final double size = widget.size;
    final Color color = widget.color;
    return SizedBox(
      width: size,
      height: size,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) => Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Visibility(
              visible: _animationController.value <= 0.7,
              child: Transform.scale(
                scale: Tween<double>(begin: 0.15, end: 1.0)
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: const Interval(
                          0.0,
                          0.7,
                          curve: Curves.easeInCubic,
                        ),
                      ),
                    )
                    .value,
                child: Opacity(
                  opacity: Tween<double>(begin: 0.0, end: 1.0)
                      .animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: const Interval(0.0, 0.2),
                        ),
                      )
                      .value,
                  child: Ring.draw(
                    color: color,
                    size: size,
                    strokeWidth: Tween<double>(begin: size / 5, end: size / 8)
                        .animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: const Interval(0.0, 0.7),
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
                color: color,
                size: size,
                strokeWidth: size / 8,
              ),
            ),
            Visibility(
              visible: _animationController.value <= 0.8 &&
                  _animationController.value >= 0.7,
              child: Transform.scale(
                scale: Tween<double>(begin: 1.0, end: 1.15)
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: const Interval(
                          0.7,
                          0.8,
                        ),
                      ),
                    )
                    .value,
                child: Ring.draw(
                  color: color,
                  size: size,
                  strokeWidth: size / 8,
                ),
              ),
            ),
            Visibility(
              visible: _animationController.value >= 0.8,
              child: Transform.scale(
                scale: Tween<double>(begin: 1.15, end: 1.0)
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: const Interval(
                          0.8,
                          0.9,
                        ),
                      ),
                    )
                    .value,
                child: Ring.draw(
                  color: color,
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
