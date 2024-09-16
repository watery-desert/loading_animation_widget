import 'package:flutter/material.dart';
import 'package:loading_animation_widget/src/util/animation_controller_utils.dart';

import '../widgets/rounded_rectangle.dart';

class BuildDot extends StatelessWidget {
  final AnimationController controller;
  final double dotWidth;
  final Color color;
  final double innerHeight;

  final Interval firstInterval;
  final Interval secondInterval;
  final Interval thirdInterval;
  final Interval forthInterval;

  const BuildDot({
    Key? key,
    required this.controller,
    required this.dotWidth,
    required this.color,
    required this.innerHeight,
    required this.firstInterval,
    required this.secondInterval,
    required this.thirdInterval,
    required this.forthInterval,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double offset = innerHeight / 4.85;
    final double height = innerHeight / 1.7;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        controller.value < firstInterval.end
            ? Align(
                alignment: Alignment.bottomCenter,
                child: Transform.translate(
                  offset: controller.eval(
                    Tween<Offset>(begin: Offset.zero, end: Offset(0, -offset)),
                    curve: firstInterval,
                  ),
                  child: RoundedRectangle.vertical(
                    width: dotWidth,
                    // height: height,
                    color: color,
                    height: controller.eval(
                      Tween<double>(begin: dotWidth, end: height),
                      curve: firstInterval,
                    ),
                  ),
                ),
              )
            : Visibility(
                visible: controller.value <= secondInterval.end,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Transform.translate(
                    offset: controller.eval(
                      Tween<Offset>(begin: Offset(0, offset), end: Offset.zero),
                      curve: secondInterval,
                    ),
                    child: RoundedRectangle.vertical(
                      width: dotWidth,
                      color: color,
                      height: controller.eval(
                        Tween<double>(begin: height, end: dotWidth),
                        curve: secondInterval,
                      ),
                    ),
                  ),
                ),
              ),
        controller.value < thirdInterval.end
            ? Visibility(
                visible: controller.value >= secondInterval.end,
                replacement: SizedBox(
                  width: dotWidth,
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Transform.translate(
                    offset: controller.eval(
                      Tween<Offset>(begin: Offset.zero, end: Offset(0, offset)),
                      curve: thirdInterval,
                    ),
                    child: RoundedRectangle.vertical(
                      width: dotWidth,
                      height: controller.eval(
                        Tween<double>(begin: dotWidth, end: height),
                        curve: thirdInterval,
                      ),
                      color: color,
                    ),
                  ),
                ),
              )
            : Align(
                alignment: Alignment.bottomCenter,
                child: Transform.translate(
                  offset: controller.eval(
                    Tween<Offset>(begin: Offset(0, -offset), end: Offset.zero),
                    curve: forthInterval,
                  ),
                  child: RoundedRectangle.vertical(
                    width: dotWidth,
                    height: controller.eval(
                      Tween<double>(begin: height, end: dotWidth),
                      curve: forthInterval,
                    ),
                    color: color,
                  ),
                ),
              ),
      ],
    );
  }
}
