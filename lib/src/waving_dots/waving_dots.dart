import 'package:flutter/material.dart';

class WavingDots extends StatefulWidget {
  final double size;
  final Color color;
  final int time;

  const WavingDots({
    Key? key,
    required this.size,
    required this.color,
    this.time = 1200,
  }) : super(key: key);

  @override
  _WavingDotsState createState() => _WavingDotsState();
}

class _WavingDotsState extends State<WavingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.time),
    )..repeat();
  }

  Widget _buildDot(
          {required Offset begin,
          required Offset end,
          required Interval interval}) =>
      Transform.translate(
        offset: Tween(begin: begin, end: end)
            .animate(
              CurvedAnimation(
                parent: _controller,
                curve: interval,
              ),
            )
            .value,
        child: Container(
          width: widget.size / 5,
          height: widget.size / 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.color,
          ),
        ),
      );

  Widget _buildBottomDot({required double begin, required double end}) {
    final double offset = -widget.size / 8;
    return _buildDot(
      begin: Offset.zero,
      end: Offset(0.0, offset),
      interval: Interval(begin, end),
    );
  }

  Widget _buildTopDot({required double begin, required double end}) {
    final double offset = -widget.size / 8;
    return _buildDot(
      begin: Offset(0.0, offset),
      end: Offset.zero,
      interval: Interval(begin, end),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double size = widget.size;
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) => SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _controller.value <= 0.50
                    ? _buildBottomDot(begin: 0.12, end: 0.50)
                    : _buildTopDot(begin: 0.62, end: 1.0),
                _controller.value <= 0.44
                    ? _buildBottomDot(begin: 0.06, end: 0.44)
                    : _buildTopDot(begin: 0.56, end: 0.94),
                _controller.value <= 0.38
                    ? _buildBottomDot(begin: 0.0, end: 0.38)
                    : _buildTopDot(begin: 0.50, end: 0.88),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
