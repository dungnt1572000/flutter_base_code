import 'package:flutter/material.dart';


class ObjectBox extends CustomPainter{
  final Rect rect;

  ObjectBox({required this.rect});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color= Colors.blue..strokeWidth=2.5..style= PaintingStyle.stroke;
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
   return false;
  }

}