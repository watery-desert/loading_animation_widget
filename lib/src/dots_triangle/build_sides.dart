import 'package:flutter/material.dart';
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

    final CurvedAnimation leftCurvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Interval(
        startInterval,
        middleInterval,
      ),
    );

    final CurvedAnimation rightCurvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Interval(
        middleInterval,
        endInterval,
      ),
    );

    final Widget firstChild = Visibility(
      visible: forward
          ? controller.value <= middleInterval
          : controller.value >= middleInterval,
      child: Transform.translate(
        offset: Tween<Offset>(
          begin: forward ? Offset.zero : Offset(offset, 0),
          end: forward ? Offset(offset, 0) : Offset.zero,
        )
            .animate(
              forward ? leftCurvedAnimation : rightCurvedAnimation,
            )
            .value,
        child: RoundedRectangle.horizontal(
          width: Tween<double>(
                  begin: forward ? depth : maxLength,
                  end: forward ? maxLength : depth)
              .animate(
                forward ? leftCurvedAnimation : rightCurvedAnimation,
              )
              .value,
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
        offset: Tween<Offset>(
          begin: forward ? Offset(-offset, 0) : Offset.zero,
          end: forward ? Offset.zero : Offset(-offset, 0),
        )
            .animate(
              forward ? rightCurvedAnimation : leftCurvedAnimation,
            )
            .value,
        child: RoundedRectangle.horizontal(
          width: Tween<double>(
                  begin: forward ? maxLength : depth,
                  end: forward ? depth : maxLength)
              .animate(
                forward ? rightCurvedAnimation : leftCurvedAnimation,
              )
              .value,
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
