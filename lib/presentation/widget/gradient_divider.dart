import 'package:baseproject/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';

class GradientColorDivider extends StatelessWidget {
  const GradientColorDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1, // Chiều cao của Divider
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            context.colors.primaryMain.withOpacity(0.5),
            context.colors.primaryMain.withOpacity(0.7),
            context.colors.primaryMain.withOpacity(0.5),
            Colors.white,
          ], // Mảng màu sắc sẽ chuyển đổi
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}
