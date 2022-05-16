import 'package:flutter/material.dart';
import '../widgets/draw_dot.dart';
import '../widgets/draw_triangle.dart';

class HalfTriangleDot extends StatefulWidget {
  final double size;
  final Color color;
  const HalfTriangleDot({
    Key? key,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  _HalfTriangleDotState createState() => _HalfTriangleDotState();
}

class _HalfTriangleDotState extends State<HalfTriangleDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final Cubic curve = Curves.easeOutQuad;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat();
  }

  bool _fistVisibility(AnimationController controller) =>
      controller.value <= 0.33;

  bool _secondVisibility(AnimationController controller) =>
      controller.value >= 0.33 && controller.value <= 0.56;

  bool _thirdVisibility(AnimationController controller) =>
      controller.value >= 0.56;

  @override
  Widget build(BuildContext context) {
    final double size = widget.size;
    final Color color = widget.color;
    final double innerHeight = 0.74 * size;
    final double innerWidth = 0.87 * size;
    final double storkeWidth = size / 8;
    final CurvedAnimation firstCurvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.0, 0.23, curve: curve),
    );

    final CurvedAnimation secondCurvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.33, 0.56, curve: curve),
    );

    final CurvedAnimation thirdCurvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.66, 0.89, curve: curve),
    );

    final Offset topLeftDotOffset = Offset(
      innerWidth / 4 - (storkeWidth / 2),
      (innerHeight - storkeWidth) / 2,
    );

    final Offset topRightDotOffset = Offset(
      innerWidth * 0.75 - (storkeWidth / 2),
      (innerHeight - storkeWidth) / 2,
    );

    final Offset bottomMiddleDotOffset = Offset(
      (innerWidth - storkeWidth) / 2,
      innerHeight - (storkeWidth / 2),
    );

    return SizedBox(
      width: size,
      height: size,
      // color: Colors.brown,
      child: Center(
        child: SizedBox(
          height: innerHeight,
          width: innerWidth,
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (_, __) => Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Visibility(
                  visible: _fistVisibility(_animationController),
                  child: Triangle.draw(
                    color: color,
                    strokeWidth: storkeWidth,
                    start: Tween<Offset>(
                      begin: Offset(innerWidth, innerHeight),
                      end: Offset(innerWidth / 2, 0),
                    ).animate(firstCurvedAnimation).value,
                    middleLine: MiddleLine(
                      Offset(innerWidth, innerHeight),
                      Offset(0, innerHeight),
                    ),
                    end: Tween<Offset>(
                      begin: Offset(innerWidth / 2, 0),
                      end: Offset(0, innerHeight),
                    ).animate(firstCurvedAnimation).value,
                  ),
                ),
                Visibility(
                  visible: _secondVisibility(_animationController),
                  child: Triangle.draw(
                    color: color,
                    strokeWidth: storkeWidth,
                    start: Tween<Offset>(
                      begin: Offset(innerWidth / 2, 0),
                      end: Offset(0, innerHeight),
                    ).animate(secondCurvedAnimation).value,
                    middleLine: MiddleLine(
                      Offset(innerWidth / 2, 0),
                      Offset(innerWidth, innerHeight),
                    ),
                    end: Tween<Offset>(
                      begin: Offset(0, innerHeight),
                      end: Offset(innerWidth, innerHeight),
                    ).animate(secondCurvedAnimation).value,
                  ),
                ),
                Visibility(
                  visible: _thirdVisibility(_animationController),
                  child: Triangle.draw(
                    color: color,
                    strokeWidth: storkeWidth,
                    start: Tween<Offset>(
                      begin: Offset(0, innerHeight),
                      end: Offset(innerWidth, innerHeight),
                    ).animate(thirdCurvedAnimation).value,
                    middleLine: MiddleLine(
                      Offset(0, innerHeight),
                      Offset(innerWidth / 2, 0),
                    ),
                    end: Tween<Offset>(
                      begin: Offset(innerWidth, innerHeight),
                      end: Offset(innerWidth / 2, 0),
                    ).animate(thirdCurvedAnimation).value,
                  ),
                ),
                SizedBox(
                  // color: Colors.green,
                  width: innerWidth,
                  height: innerHeight,
                  child: Stack(
                    children: <Widget>[
                      Visibility(
                        visible: _fistVisibility(_animationController),
                        child: Transform.translate(
                          offset: Tween<Offset>(
                                  begin: topRightDotOffset,
                                  end: topLeftDotOffset)
                              .animate(firstCurvedAnimation)
                              .value,
                          child: DrawDot.circular(
                            dotSize: storkeWidth,
                            color: color,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _secondVisibility(_animationController),
                        child: Transform.translate(
                          offset: Tween<Offset>(
                                  begin: topLeftDotOffset,
                                  end: bottomMiddleDotOffset)
                              .animate(secondCurvedAnimation)
                              .value,
                          child: DrawDot.circular(
                            dotSize: storkeWidth,
                            color: color,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _thirdVisibility(_animationController),
                        child: Transform.translate(
                          offset: Tween<Offset>(
                                  begin: bottomMiddleDotOffset,
                                  end: topRightDotOffset)
                              .animate(thirdCurvedAnimation)
                              .value,
                          child: DrawDot.circular(
                            dotSize: storkeWidth,
                            color: color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
