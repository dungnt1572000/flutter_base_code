import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ObjectBox extends CustomPainter{
  final Rect rect;

  ObjectBox({required this.rect});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color= Colors.blue..strokeWidth=2.5..style= PaintingStyle.stroke;
    print('day la rect'+rect.left.toString());
    // final arect = Rect.fromPoints(Offset(size.width*1/4,size.height*1/4), Offset(size.width*3/4,size.height*3/4));
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
   return false;
  }

}