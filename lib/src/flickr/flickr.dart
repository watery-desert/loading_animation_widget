import 'dart:ffi';

import 'package:flutter/material.dart';

class Flickr extends StatefulWidget {
  final List<Color> colors;
  final double size;
  final int duration;
  const Flickr({
    Key? key,
    required this.colors,
    required this.size,
    this.duration = 2000,
  })  : assert(colors.length == 2),
        super(key: key);

  @override
  _FlickrState createState() => _FlickrState();
}

class _FlickrState extends State<Flickr> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final curves = Curves.ease;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.size;
    final colors = widget.colors;

    return Container(
      // color: Colors.green,
      width: size,
      height: size,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) => Stack(
          alignment: Alignment.center,
          children: [
            Disk(
              size: size / 2,
              color: colors[0],
              initialOffset: Offset(-size / 4, 0),
              finalOffset: Offset(size / 4, 0),
              interval: Interval(0.0, 0.5, curve: curves),
              controller: _animationController,
              visibility: _animationController.value <= 0.5,
            ),
            Disk(
              size: size / 2,
              color: colors[1],
              initialOffset: Offset(size / 4, 0),
              finalOffset: Offset(-size / 4, 0),
              interval: Interval(0.0, 0.5, curve: curves),
              visibility: _animationController.value <= 0.5,
              controller: _animationController,
            ),
            Disk(
              size: size / 2,
              color: colors[1],
              initialOffset: Offset(-size / 4, 0),
              finalOffset: Offset(size / 4, 0),
              controller: _animationController,
              interval: Interval(0.5, 1.0, curve: curves),
              visibility: _animationController.value >= 0.5,
            ),
            Disk(
              size: size / 2,
              color: colors[0],
              initialOffset: Offset(size / 4, 0),
              finalOffset: Offset(-size / 4, 0),
              controller: _animationController,
              interval: Interval(0.5, 1.0, curve: curves),
              visibility: _animationController.value >= 0.5,
            ),
          ],
        ),
      ),
    );
  }
}

class Disk extends StatelessWidget {
  final double size;
  final Color color;
  final Offset initialOffset;
  final Offset finalOffset;
  final Interval interval;
  final bool visibility;
  final AnimationController controller;
  const Disk({
    Key? key,
    required this.size,
    required this.color,
    required this.initialOffset,
    required this.finalOffset,
    required this.interval,
    required this.visibility,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final offsetAnimation = Tween(begin: initialOffset, end: finalOffset)
        .animate(
          CurvedAnimation(parent: controller, curve: interval),
        )
        .value;

    return Visibility(
      visible: visibility,
      child: Transform.translate(
        offset: offsetAnimation,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}
