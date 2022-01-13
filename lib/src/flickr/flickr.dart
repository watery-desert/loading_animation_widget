import 'package:flutter/material.dart';

class Flickr extends StatefulWidget {
  final Color leftDotColor;
  final Color rightDotColor;
  final double size;

  const Flickr({
    Key? key,
    required this.leftDotColor,
    required this.rightDotColor,
    required this.size,
  }) : super(key: key);

  @override
  _FlickrState createState() => _FlickrState();
}

class _FlickrState extends State<Flickr> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final Cubic curves = Curves.ease;
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
    final Color leftDotColor = widget.leftDotColor;
    final Color rightDotColor = widget.rightDotColor;

    return SizedBox(
      width: size,
      height: size,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) => Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _BuildDot(
              size: size / 2,
              color: leftDotColor,
              initialOffset: Offset(-size / 4, 0),
              finalOffset: Offset(size / 4, 0),
              interval: Interval(0.0, 0.5, curve: curves),
              controller: _animationController,
              visibility: _animationController.value <= 0.5,
            ),
            _BuildDot(
              size: size / 2,
              color: rightDotColor,
              initialOffset: Offset(size / 4, 0),
              finalOffset: Offset(-size / 4, 0),
              interval: Interval(0.0, 0.5, curve: curves),
              visibility: _animationController.value <= 0.5,
              controller: _animationController,
            ),
            _BuildDot(
              size: size / 2,
              color: rightDotColor,
              initialOffset: Offset(-size / 4, 0),
              finalOffset: Offset(size / 4, 0),
              controller: _animationController,
              interval: Interval(0.5, 1.0, curve: curves),
              visibility: _animationController.value >= 0.5,
            ),
            _BuildDot(
              size: size / 2,
              color: leftDotColor,
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

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class _BuildDot extends StatelessWidget {
  final double size;
  final Color color;
  final Offset initialOffset;
  final Offset finalOffset;
  final Interval interval;
  final bool visibility;
  final AnimationController controller;

  const _BuildDot({
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
    final Offset offsetAnimation = Tween<Offset>(
      begin: initialOffset,
      end: finalOffset,
    )
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
