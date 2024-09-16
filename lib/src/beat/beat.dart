import 'package:flutter/material.dart';
import 'package:loading_animation_widget/src/util/animation_controller_utils.dart';

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
                scale: _animationController.evalDouble(
                  from: 0.15,
                  end: 0.7,
                  curve: Curves.easeInCubic,
                ),
                child: Opacity(
                  opacity: _animationController.evalDouble(end: 0.2),
                  child: Ring.draw(
                    color: color,
                    size: size,
                    strokeWidth: _animationController.evalDouble(
                      from: size / 5,
                      to: size / 8,
                      end: 0.7,
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _animationController.value <= 0.7,
              child: Ring.draw(
                color: color,
                size: size,
                strokeWidth: _animationController.evalDouble(
                  from: size / 5,
                  to: size / 8,
                  end: 0.7,
                ),
              ),
            ),
            Visibility(
              visible: _animationController.value <= 0.8 &&
                  _animationController.value >= 0.7,
              child: Transform.scale(
                scale: _animationController.evalDouble(
                  from: 1,
                  to: 1.15,
                  begin: 0.7,
                  end: 0.8,
                ),
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
                scale: _animationController.evalDouble(
                  from: 1.15,
                  to: 1,
                  begin: 0.8,
                  end: 0.9,
                ),
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
