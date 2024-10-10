import 'package:flutter/material.dart';

class ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final Path path = Path();
    path.moveTo(size.width / 2 - 10, size.height);
    path.lineTo(size.width / 2 + 10, size.height);
    path.lineTo(size.width / 2, size.height - 10);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
