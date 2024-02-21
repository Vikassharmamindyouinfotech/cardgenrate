import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GrainyTexture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(
          Get.width, Get.height), // Adjust the size according to your needs
      painter: GrainyPainter(),
    );
  }
}

class GrainyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.pink.withOpacity(0.1)
      ..strokeWidth = 1.0;

    final random = Random(DateTime.now().microsecond);

    // Draw random dots on the canvas to create a grainy effect
    for (var i = 0; i < size.width.toInt() * size.height.toInt() * 0.1; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      canvas.drawPoints(PointMode.points, [Offset(x, y)], paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
