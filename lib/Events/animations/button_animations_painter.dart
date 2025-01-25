// lib/widgets/button_animation_painter.dart

import 'package:flutter/material.dart';

class ButtonAnimationPainter extends CustomPainter {
  final Animation<double> animation;

  ButtonAnimationPainter({required this.animation}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();
    final width = size.width;
    final height = size.height;
    
    for (var i = 0; i < 3; i++) {
      final progress = (animation.value + i / 3) % 1.0;
      final x = width * progress;
      
      path.moveTo(x, 0);
      path.lineTo(x - 10, height);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(ButtonAnimationPainter oldDelegate) => true;
}



class CircuitOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    // Draw tech circuit pattern
    final spacing = size.width / 20;
    for (double i = 0; i < size.width; i += spacing) {
      // Horizontal lines
      canvas.drawLine(
        Offset(i, 0.0),
        Offset(i, size.height),
        paint,
      );
      
      // Add some random "components"
      if ((i % (spacing * 3)).abs() < 0.001) {
        canvas.drawCircle(
          Offset(i, size.height / 2),
          spacing / 2,
          paint,
        );
      }
    }

    // Draw some diagonal lines for added tech effect
    for (double i = 0; i < size.width; i += spacing * 4) {
      canvas.drawLine(
        Offset(i, 0.0),
        Offset(i + spacing * 2, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}