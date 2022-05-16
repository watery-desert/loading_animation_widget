import 'package:flutter/material.dart';
import 'build_dot.dart';

class StretchedDots extends StatefulWidget {
  final double size;
  // final int time;
  final Color color;
  final double innerHeight;
  final double dotWidth;

  const StretchedDots({
    Key? key,
    required this.size,
    required this.color,
    // required this.time,
  })  : innerHeight = size / 1.3,
        dotWidth = size / 8,
        super(key: key);

  @override
  State<StretchedDots> createState() => _StretchedDotsState();
}

class _StretchedDotsState extends State<StretchedDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final Cubic firstCurve = Curves.easeInCubic;
  final Cubic seconCurve = Curves.easeOutCubic;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final double size = widget.size;
    final double innerHeight = widget.innerHeight;
    final double dotWidth = widget.dotWidth;
    final Color color = widget.color;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, __) => Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        child: SizedBox(
          height: innerHeight,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  BuildDot(
                    controller: _animationController,
                    innerHeight: innerHeight,
                    firstInterval: Interval(
                      0.0,
                      0.15,
                      curve: firstCurve,
                    ),
                    secondInterval: Interval(
                      0.15,
                      0.30,
                      curve: seconCurve,
                    ),
                    thirdInterval: Interval(
                      0.5,
                      0.65,
                      curve: firstCurve,
                    ),
                    forthInterval: Interval(
                      0.65,
                      0.80,
                      curve: seconCurve,
                    ),
                    dotWidth: dotWidth,
                    color: color,
                  ),
                  BuildDot(
                    controller: _animationController,
                    innerHeight: innerHeight,
                    firstInterval: Interval(
                      0.05,
                      0.20,
                      curve: firstCurve,
                    ),
                    secondInterval: Interval(
                      0.20,
                      0.35,
                      curve: seconCurve,
                    ),
                    thirdInterval: Interval(
                      0.55,
                      0.70,
                      curve: firstCurve,
                    ),
                    forthInterval: Interval(
                      0.70,
                      0.85,
                      curve: seconCurve,
                    ),
                    dotWidth: dotWidth,
                    color: color,
                  ),
                  BuildDot(
                    controller: _animationController,
                    innerHeight: innerHeight,
                    firstInterval: Interval(
                      0.10,
                      0.25,
                      curve: firstCurve,
                    ),
                    secondInterval: Interval(
                      0.25,
                      0.40,
                      curve: seconCurve,
                    ),
                    thirdInterval: Interval(
                      0.60,
                      0.75,
                      curve: firstCurve,
                    ),
                    forthInterval: Interval(
                      0.75,
                      0.90,
                      curve: seconCurve,
                    ),
                    dotWidth: dotWidth,
                    color: color,
                  ),
                  BuildDot(
                    controller: _animationController,
                    innerHeight: innerHeight,
                    firstInterval: Interval(
                      0.15,
                      0.30,
                      curve: firstCurve,
                    ),
                    secondInterval: Interval(
                      0.30,
                      0.45,
                      curve: seconCurve,
                    ),
                    thirdInterval: Interval(
                      0.65,
                      0.80,
                      curve: firstCurve,
                    ),
                    forthInterval: Interval(
                      0.80,
                      0.95,
                      curve: seconCurve,
                    ),
                    dotWidth: dotWidth,
                    color: color,
                  ),
                ],
              ),
            ],
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
