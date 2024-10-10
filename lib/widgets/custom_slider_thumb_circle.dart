import 'package:flutter/material.dart';
import '../helpers/app_colors.dart';

class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final Color thumbColor;
  final double sliderValue;
  final String unit;

  CustomSliderThumbCircle({
    required this.thumbRadius,
    required this.thumbColor,
    required this.sliderValue,
    required this.unit,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final Canvas canvas = context.canvas;

    final Paint paint = Paint()
      ..color = thumbColor
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, thumbRadius - 4, paint);

    final Paint paintBorder = Paint()
      ..color = AppColors.appPrimaryColor
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, thumbRadius - 4, paintBorder);

    // Draw the container above the thumb with arrow
    final double containerWidth = 60;
    final double containerHeight = 30;
    final Offset containerOffset = Offset(center.dx - containerWidth / 2, center.dy - 45);

    final Rect rect = Rect.fromLTWH(containerOffset.dx, containerOffset.dy, containerWidth, containerHeight);
    final RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(8));

    final Paint containerPaint = Paint()
      ..color = AppColors.appPrimaryColor
      ..style = PaintingStyle.fill;

    canvas.drawRRect(rrect, containerPaint);

    final Paint containerBorderPaint = Paint()
      ..color = AppColors.appPrimaryColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawRRect(rrect, containerBorderPaint);

    // Draw the text inside the container
    TextSpan span = TextSpan(
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      text: '${sliderValue.toInt()} $unit',
    );
    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    Offset textCenter = Offset(containerOffset.dx + (containerWidth - tp.width) / 2, containerOffset.dy + (containerHeight - tp.height) / 2);
    tp.paint(canvas, textCenter);

    // Draw the downward-pointing arrow below the text container
    // Draw the arrow below the thumb

    final Path arrowPath = Path();
    arrowPath.moveTo(center.dx, center.dy - 5); // Start point of arrow at the bottom center of the container
    arrowPath.lineTo(center.dx - 4, center.dy - 15); // Left point of arrow
    arrowPath.lineTo(center.dx + 4, center.dy - 15); // Right point of arrow
    arrowPath.close(); // Close the ath to form the triangle

    final Paint arrowPaint = Paint()
      ..color = AppColors.appPrimaryColor
      ..style = PaintingStyle.fill;

    canvas.drawPath(arrowPath, arrowPaint);
  }
}
