import 'package:flutter/material.dart';
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
                  offset: Tween<Offset>(
                    begin: Offset.zero,
                    end: Offset(0, -offset),
                  )
                      .animate(
                        CurvedAnimation(
                          parent: controller,
                          curve: firstInterval,
                        ),
                      )
                      .value,
                  child: RoundedRectangle.vertical(
                    width: dotWidth,
                    // height: height,
                    color: color,
                    height: Tween<double>(begin: dotWidth, end: height)
                        .animate(
                          CurvedAnimation(
                            parent: controller,
                            curve: firstInterval,
                          ),
                        )
                        .value,
                  ),
                ),
              )
            : Visibility(
                visible: controller.value <= secondInterval.end,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Transform.translate(
                    offset: Tween<Offset>(
                            begin: Offset(0, offset), end: Offset.zero)
                        .animate(
                          CurvedAnimation(
                            parent: controller,
                            curve: secondInterval,
                          ),
                        )
                        .value,
                    child: RoundedRectangle.vertical(
                      width: dotWidth,
                      // height: height,
                      color: color,
                      height: Tween<double>(
                        begin: height,
                        end: dotWidth,
                      )
                          .animate(CurvedAnimation(
                            parent: controller,
                            curve: secondInterval,
                          ))
                          .value,
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
                    // offset: Offset(0, offset),
                    offset: Tween<Offset>(
                      begin: Offset.zero,
                      end: Offset(0, offset),
                    )
                        .animate(
                          CurvedAnimation(
                            parent: controller,
                            curve: thirdInterval,
                          ),
                        )
                        .value,
                    child: RoundedRectangle.vertical(
                      width: dotWidth,
                      // height: height,
                      height: Tween<double>(
                        begin: dotWidth,
                        end: height,
                      )
                          .animate(CurvedAnimation(
                            parent: controller,
                            curve: thirdInterval,
                          ))
                          .value,
                      color: color,
                    ),
                  ),
                ),
              )
            : Align(
                alignment: Alignment.bottomCenter,
                child: Transform.translate(
                  offset: Tween<Offset>(
                    begin: Offset(0, -offset),
                    end: Offset.zero,
                  )
                      .animate(
                        CurvedAnimation(
                          parent: controller,
                          curve: forthInterval,
                        ),
                      )
                      .value,
                  child: RoundedRectangle.vertical(
                    width: dotWidth,
                    height: Tween<double>(
                      begin: height,
                      end: dotWidth,
                    )
                        .animate(
                          CurvedAnimation(
                            parent: controller,
                            curve: forthInterval,
                          ),
                        )
                        .value,
                    color: color,
                  ),
                ),
              ),
      ],
    );
  }
}
