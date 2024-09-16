import 'package:flutter/material.dart';
import 'package:loading_animation_widget/src/util/animation_controller_utils.dart';
import 'dart:math' as math;
import '../widgets/draw_dot.dart';

class SwivelDot extends StatelessWidget {
  final double dotSize;
  final Offset rotationOrigin;
  final Color color;
  final AnimationController controller;
  final bool left;
  final double firstInterval;
  final double secondInterval;
  final double thirdInterval;
  final double fourthInterval;

  const SwivelDot.left({
    Key? key,
    required this.color,
    required this.dotSize,
    required this.rotationOrigin,
    required this.controller,
    required this.firstInterval,
    required this.secondInterval,
    required this.thirdInterval,
    required this.fourthInterval,
  })  : left = true,
        super(key: key);

  const SwivelDot.right({
    Key? key,
    required this.color,
    required this.dotSize,
    required this.rotationOrigin,
    required this.controller,
    required this.firstInterval,
    required this.secondInterval,
    required this.thirdInterval,
    required this.fourthInterval,
  })  : left = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Visibility(
          visible: controller.value <= thirdInterval,
          child: Transform.rotate(
            origin: rotationOrigin,
            angle: controller.evalDouble(
              to: math.pi / (left ? 5 : -5),
              begin: firstInterval,
              end: secondInterval,
            ),
            child: DrawDot.circular(
              color: color,
              dotSize: dotSize,
            ),
          ),
        ),
        Visibility(
          visible: controller.value >= thirdInterval,
          child: Transform.rotate(
            origin: rotationOrigin,
            angle: controller.evalDouble(
              from: math.pi / (left ? 5 : -5),
              to: 0,
              begin: thirdInterval,
              end: fourthInterval,
            ),
            child: DrawDot.circular(
              color: color,
              dotSize: dotSize,
            ),
          ),
        ),
      ],
    );
  }
}
