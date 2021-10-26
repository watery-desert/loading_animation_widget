import 'package:flutter/material.dart';

class StaggeredDotWave extends StatelessWidget {
  final double size;
  final Color color;
  final int time;
  const StaggeredDotWave(
      {Key? key, required this.size, required this.color, this.time = 1600})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final oddDotHeight = size * 0.4;
    final evenDotHeight = size * 0.7;
    final Duration duration = Duration(milliseconds: time);

    return Container(
      alignment: Alignment.center,
      // color: Colors.black,
      width: size,
      height: size,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DotContainer(
            heightInterval: Interval(0.0, 0.1),
            offsetInterval: Interval(0.18, 0.28),
            reverseHeightInterval: Interval(0.28, 0.38),
            reverseOffsetInterval: Interval(0.47, 0.57),
            color: color,
            size: size,
            duration: duration,
            maxHeight: oddDotHeight,
          ),
          DotContainer(
            heightInterval: Interval(0.09, 0.19),
            offsetInterval: Interval(0.27, 0.37),
            reverseHeightInterval: Interval(0.37, 0.47),
            reverseOffsetInterval: Interval(0.56, 0.66),
            color: color,
            size: size,
            duration: duration,
            maxHeight: evenDotHeight,
          ),
          DotContainer(
            heightInterval: Interval(0.18, 0.28),
            offsetInterval: Interval(0.36, 0.46),
            reverseHeightInterval: Interval(0.46, 0.56),
            reverseOffsetInterval: Interval(0.65, 0.75),
            color: color,
            size: size,
            duration: duration,
            maxHeight: oddDotHeight,
          ),
          DotContainer(
            heightInterval: Interval(0.27, 0.37),
            offsetInterval: Interval(0.45, 0.55),
            reverseHeightInterval: Interval(0.55, 0.65),
            reverseOffsetInterval: Interval(0.74, 0.84),
            color: color,
            size: size,
            duration: duration,
            maxHeight: evenDotHeight,
          ),
          DotContainer(
            heightInterval: Interval(0.36, 0.46),
            offsetInterval: Interval(0.54, 0.64),
            reverseHeightInterval: Interval(0.64, 0.74),
            reverseOffsetInterval: Interval(0.83, 0.93),
            color: color,
            size: size,
            duration: duration,
            maxHeight: oddDotHeight,
          ),
        ],
      ),
    );
  }
}

class DotContainer extends StatefulWidget {
  final Interval offsetInterval;
  final double size;
  final Color color;
  final Duration duration;
  final Interval reverseOffsetInterval;
  final Interval heightInterval;
  final Interval reverseHeightInterval;
  final double maxHeight;

  const DotContainer({
    Key? key,
    required this.offsetInterval,
    required this.size,
    required this.color,
    required this.duration,
    required this.reverseOffsetInterval,
    required this.heightInterval,
    required this.reverseHeightInterval,
    required this.maxHeight,
  }) : super(key: key);

  @override
  _DotContainerState createState() => _DotContainerState();
}

class _DotContainerState extends State<DotContainer>
    with TickerProviderStateMixin {
  late AnimationController _offsetController;
  late AnimationController _heightController;

  @override
  void initState() {
    super.initState();

    _offsetController =
        AnimationController(vsync: this, duration: widget.duration)..forward();

    _heightController =
        AnimationController(vsync: this, duration: widget.duration)..forward();

    _offsetController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _offsetController.forward(from: 0.0);
        _heightController.forward(from: 0.0);
      }
    });

    // _heightController.addStatusListener((status) {
    //   if (status == AnimationStatus.dismissed) {
    //     _heightController.reverse();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    final interval = widget.offsetInterval;
    final reverseInterval = widget.reverseOffsetInterval;
    final heightInterval = widget.heightInterval;
    final size = widget.size;
    final reverseHeightInterval = widget.reverseHeightInterval;
    final maxHeight = widget.maxHeight;
    final double maxDy = -(size * 0.20);

    return AnimatedBuilder(
      animation: _offsetController,
      builder: (_, __) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: _offsetController.value <= interval.end ? 1 : 0,
              // opacity: 1,
              child: Transform.translate(
                offset: Tween(begin: Offset.zero, end: Offset(0, maxDy))
                    .animate(CurvedAnimation(
                        parent: _offsetController, curve: interval))
                    .value,
                child: AnimatedBuilder(
                  animation: _heightController,
                  builder: (_, __) => Container(
                    width: size * 0.13,
                    height: Tween<double>(begin: size * 0.13, end: maxHeight)
                        .animate(CurvedAnimation(
                            parent: _heightController, curve: heightInterval))
                        .value,
                    decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: BorderRadius.circular(widget.size),
                    ),
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: _offsetController.value >= interval.end ? 1 : 0,
              child: Transform.translate(
                offset: Tween(begin: Offset(0, maxDy), end: Offset.zero)
                    .animate(CurvedAnimation(
                        parent: _offsetController, curve: reverseInterval))
                    .value,
                child: AnimatedBuilder(
                  animation: _heightController,
                  builder: (_, __) => Container(
                    width: widget.size * 0.13,
                    height: Tween<double>(end: size * 0.13, begin: maxHeight)
                        .animate(CurvedAnimation(
                            parent: _heightController,
                            curve: reverseHeightInterval))
                        .value,
                    decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: BorderRadius.circular(widget.size),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _offsetController.dispose();
    _heightController.dispose();
    super.dispose();
  }
}
