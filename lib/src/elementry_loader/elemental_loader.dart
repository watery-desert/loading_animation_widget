import 'package:flutter/material.dart';
import '../widgets/draw_arc.dart';
import 'dart:math' as math;

class ElementalLoader extends StatefulWidget {
  final double size;
  final Color color;
  const ElementalLoader({
    Key? key,
    required this.color,
    required this.size,
  }) : super(key: key);

  @override
  _ElementalLoaderState createState() => _ElementalLoaderState();
}

class _ElementalLoaderState extends State<ElementalLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.size;
    final strokeWidth = size / 10;
    final Cubic firstCurve = Curves.easeInQuart;
    final Cubic secondCurve = Curves.easeOutQuart;
    final color = widget.color;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, __) => Stack(
        children: [
          // Arc.draw(
          //   color: Colors.black.withOpacity(0.2),
          //   size: size,
          //   strokeWidth: strokeWidth,
          //   startAngle: 0.0,
          //   // endAngle: math.pi / (size * size),
          //   endAngle: 2 * math.pi,
          // ),
          Visibility(
            visible: _animationController.value <= 0.5,
            child: Transform.rotate(
              angle: Tween(begin: 0.0, end: 3 * math.pi / 4)
                  .animate(
                    CurvedAnimation(
                      parent: _animationController,
                      curve: Interval(0.0, 0.5, curve: firstCurve),
                    ),
                  )
                  .value,
              child: Arc.draw(
                color: color,
                size: size,
                strokeWidth: strokeWidth,
                startAngle: -math.pi / 2,
                // endAngle: math.pi / (size * size),
                endAngle:
                    Tween(begin: math.pi / (size * size), end: -math.pi / 2)
                        .animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: Interval(0.0, 0.5, curve: firstCurve),
                          ),
                        )
                        .value,
              ),
            ),
          ),
          Visibility(
            visible: _animationController.value >= 0.5,
            child: Transform.rotate(
              angle: Tween(begin: math.pi / 4, end: math.pi)
                  .animate(
                    CurvedAnimation(
                      parent: _animationController,
                      curve: Interval(0.5, 1.0, curve: secondCurve),
                    ),
                  )
                  .value,
              child: Arc.draw(
                color: color,
                size: size,
                strokeWidth: strokeWidth,
                startAngle: -math.pi / 2,
                // endAngle: math.pi / (size * size),
                endAngle:
                    Tween(begin: math.pi / 2, end: math.pi / (size * size))
                        .animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: Interval(0.5, 1.0, curve: secondCurve),
                          ),
                        )
                        .value,
              ),
            ),
          ),

          ///
          ///second one
          ///
          ///
          Visibility(
            visible: _animationController.value <= 0.5,
            child: Transform.rotate(
              angle: Tween(begin: -math.pi, end: -math.pi / 4)
                  .animate(
                    CurvedAnimation(
                      parent: _animationController,
                      curve: Interval(0.0, 0.5, curve: firstCurve),
                    ),
                  )
                  .value,
              child: Arc.draw(
                color: color,
                size: size,
                strokeWidth: strokeWidth,
                startAngle: -math.pi / 2,
                // endAngle: math.pi / (size * size),
                endAngle:
                    Tween(begin: math.pi / (size * size), end: -math.pi / 2)
                        .animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: Interval(0.0, 0.5, curve: firstCurve),
                          ),
                        )
                        .value,
              ),
            ),
          ),
          Visibility(
            visible: _animationController.value >= 0.5,
            child: Transform.rotate(
              angle: Tween(begin: -3 * math.pi / 4, end: 0.0)
                  .animate(
                    CurvedAnimation(
                      parent: _animationController,
                      curve: Interval(0.5, 1.0, curve: secondCurve),
                    ),
                  )
                  .value,
              child: Arc.draw(
                color: color,
                size: size,
                strokeWidth: strokeWidth,
                startAngle: -math.pi / 2,
                // endAngle: math.pi / (size * size),
                endAngle:
                    Tween(begin: math.pi / 2, end: math.pi / (size * size))
                        .animate(CurvedAnimation(
                          parent: _animationController,
                          curve: Interval(0.5, 1.0, curve: secondCurve),
                        ))
                        .value,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
