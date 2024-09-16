import 'package:flutter/material.dart';
import 'package:loading_animation_widget/src/util/animation_controller_utils.dart';
import 'dart:math' as math;
import '../widgets/draw_arc.dart';

class InkDrop extends StatefulWidget {
  final double size;
  final Color color;
  final Color ringColor;

  const InkDrop({
    Key? key,
    required this.size,
    required this.color,
    this.ringColor = const Color(0x1A000000),
  }) : super(key: key);

  @override
  _InkDropState createState() => _InkDropState();
}

class _InkDropState extends State<InkDrop> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final double size = widget.size;
    final Color color = widget.color;
    final Color ringColor = widget.ringColor;
    final double strokeWidth = size / 5;
    return SizedBox(
      width: size,
      height: size,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) => Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Arc.draw(
              strokeWidth: strokeWidth,
              size: size,
              color: ringColor,
              startAngle: math.pi / 2,
              endAngle: 2 * math.pi,
            ),
            Visibility(
              visible: _animationController.value <= 0.9,
              child: Transform.translate(
                offset: _animationController.eval(
                  Tween<Offset>(
                    begin: Offset(0, -size),
                    end: Offset.zero,
                  ),
                  curve: const Interval(
                    0.05,
                    0.4,
                    curve: Curves.easeInCubic,
                  ),
                ),
                child: Arc.draw(
                  strokeWidth: strokeWidth,
                  size: size,
                  color: color,
                  startAngle: -3 * math.pi / 2,
                  endAngle: _animationController.evalDouble(
                    from: math.pi / (size * size),
                    to: math.pi / 1.13,
                    begin: 0.38,
                    end: 0.9,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _animationController.value <= 0.9,
              child: Transform.translate(
                offset: _animationController.eval(
                  Tween<Offset>(
                    begin: Offset(0, -size),
                    end: Offset.zero,
                  ),
                  curve: const Interval(
                    0.05,
                    0.4,
                    curve: Curves.easeInCubic,
                  ),
                ),
                child: Arc.draw(
                  strokeWidth: strokeWidth,
                  size: size,
                  color: color,
                  startAngle: -3 * math.pi / 2,
                  endAngle: _animationController.evalDouble(
                    from: math.pi / (size * size),
                    to: -math.pi / 1.13,
                    begin: 0.38,
                    end: 0.9,
                  ),
                ),
              ),
            ),

            /// Right
            Visibility(
              visible: _animationController.value >= 0.9,
              child: Arc.draw(
                strokeWidth: strokeWidth,
                size: size,
                color: color,
                startAngle: -math.pi / 4,
                endAngle: _animationController.evalDouble(
                  from: -math.pi / 7.4,
                  to: -math.pi / 4,
                  begin: 0.9,
                  end: 0.96,
                ),
              ),
            ),
            // Left
            Visibility(
              visible: _animationController.value >= 0.9,
              child: Arc.draw(
                strokeWidth: strokeWidth,
                size: size,
                color: color,
                startAngle: -3 * math.pi / 4,
                endAngle: _animationController.evalDouble(
                  from: math.pi / 7.4,
                  to: math.pi / 4,
                  begin: 0.9,
                  end: 0.96,
                ),
              ),
            ),

            /// Right
            Visibility(
              visible: _animationController.value >= 0.9,
              child: Arc.draw(
                strokeWidth: strokeWidth,
                size: size,
                color: color,
                startAngle: -math.pi / 3.5,
                endAngle: _animationController.evalDouble(
                  from: math.pi / 1.273,
                  to: math.pi / 28,
                  begin: 0.9,
                ),
              ),
            ),

            /// Left
            Visibility(
              visible: _animationController.value >= 0.9,
              child: Arc.draw(
                strokeWidth: strokeWidth,
                size: size,
                color: color,
                startAngle: math.pi / 0.778,
                endAngle: _animationController.evalDouble(
                  from: -math.pi / 1.273,
                  to: -math.pi / 27,
                  begin: 0.9,
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
