import 'dart:math' as math;
import 'package:flutter/material.dart';

class ProgressArc extends CustomPainter {
  final double? arc;
  final Color progressColor;

  const ProgressArc({
    Key? key,
    required this.arc,
    required this.progressColor,
  }) : super();

  @override
  void paint(Canvas canvas, Size size) {
    const rect = Rect.fromLTRB(0, 0, 110, 110);
    const startAngle = -math.pi;
    final sweepAngle = arc ?? math.pi;
    const useCenter = false;
    final paint = Paint()
      ..strokeCap = StrokeCap.butt
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 22;

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
