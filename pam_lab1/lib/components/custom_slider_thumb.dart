import 'package:flutter/material.dart';

class CustomSliderThumbWithShadow extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(20.0, 20.0);
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

    final shadowPaint1 = Paint()
      ..color = Color(0xFF18274B).withOpacity(0.08)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 4);

    final shadowPaint2 = Paint()
      ..color = Color(0xFF18274B).withOpacity(0.12)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 6);

    canvas.drawCircle(center, 16, shadowPaint1);
    canvas.drawCircle(center, 16, shadowPaint2);

    final thumbPaint = Paint()..color = sliderTheme.thumbColor ?? Colors.blue;
    final borderPaint = Paint()..color = Colors.white; // White border

    canvas.drawCircle(
      center,
      16,
      borderPaint,
    );

    canvas.drawCircle(
      center,
      10,
      thumbPaint,
    );
  }
}
