import 'package:flutter/material.dart';

class Triangle extends CustomPainter {
  final Color _color;
  final double _strokeWidth;
  final Offset _start;
  final Offset _end;
  final MiddleLine _middleLine;

  Triangle._(
    this._color,
    this._strokeWidth,
    this._start,
    this._end,
    this._middleLine,
  );

  static Widget draw({
    required Color color,
    required double strokeWidth,
    required Offset start,
    required Offset end,
    required MiddleLine middleLine,
  }) =>
      CustomPaint(
        painter: Triangle._(
          color,
          strokeWidth,
          start,
          end,
          middleLine,
        ),
      );

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = _color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = _strokeWidth;

    final Path path = Path()
      // ..moveTo(size.width / 2, 0)
      ..moveTo(_start.dx, _start.dy)
      // ..lineTo(size.width, size.height)
      ..lineTo(_middleLine.startPoint.dx, _middleLine.startPoint.dy)
      // ..lineTo(0, size.height)
      ..lineTo(_middleLine.endPoint.dx, _middleLine.endPoint.dy)
      ..lineTo(_end.dx, _end.dy);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class MiddleLine {
  final Offset startPoint;
  final Offset endPoint;

  MiddleLine(this.startPoint, this.endPoint);
}
