import 'package:flutter/material.dart';
import 'package:loading_animation_widget/src/util/animation_controller_utils.dart';

import '../widgets/rounded_rectangle.dart';

class BuildSides extends StatelessWidget {
  final double maxLength;
  final double depth;
  final Color color;
  final AnimationController controller;
  final Interval interval;
  final double rotationAngle;
  final Offset rotationOrigin;
  final bool forward;

  const BuildSides.forward({
    Key? key,
    required this.maxLength,
    required this.depth,
    required this.color,
    required this.controller,
    required this.interval,
    this.rotationAngle = 0,
    this.rotationOrigin = Offset.zero,
  })  : forward = true,
        super(key: key);

  const BuildSides.reverse({
    Key? key,
    required this.maxLength,
    required this.depth,
    required this.color,
    required this.controller,
    required this.interval,
    this.rotationAngle = 0,
    this.rotationOrigin = Offset.zero,
  })  : forward = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final double offset = maxLength / 2;
    final double startInterval = interval.begin;
    final double middleInterval = (interval.begin + interval.end) / 2;

    final double endInterval = interval.end;

    final Interval leftInterval = Interval(startInterval, middleInterval);
    final Interval rightInterval = Interval(middleInterval, endInterval);

    final Widget firstChild = Visibility(
      visible: forward
          ? controller.value <= middleInterval
          : controller.value >= middleInterval,
      child: Transform.translate(
        offset: controller.eval(
          Tween<Offset>(
            begin: forward ? Offset.zero : Offset(offset, 0),
            end: forward ? Offset(offset, 0) : Offset.zero,
          ),
          curve: forward ? leftInterval : rightInterval,
        ),
        child: RoundedRectangle.horizontal(
          width: controller.eval(
            Tween<double>(
              begin: forward ? depth : maxLength,
              end: forward ? maxLength : depth,
            ),
            curve: forward ? leftInterval : rightInterval,
          ),
          height: depth,
          color: color,
        ),
      ),
    );

    final Widget secondChild = Visibility(
      visible: forward
          ? controller.value >= middleInterval
          : controller.value <= middleInterval,
      child: Transform.translate(
        offset: controller.eval(
          Tween<Offset>(
            begin: forward ? Offset(-offset, 0) : Offset.zero,
            end: forward ? Offset.zero : Offset(-offset, 0),
          ),
          curve: forward ? rightInterval : leftInterval,
        ),
        child: RoundedRectangle.horizontal(
          width: controller.eval(
            Tween<double>(
              begin: forward ? maxLength : depth,
              end: forward ? depth : maxLength,
            ),
            curve: forward ? rightInterval : leftInterval,
          ),
          height: depth,
          color: color,
        ),
      ),
    );

    final List<Widget> children = <Widget>[firstChild, secondChild];

    return Transform.rotate(
      angle: rotationAngle,
      origin: rotationOrigin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }
}
