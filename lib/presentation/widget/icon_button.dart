import 'package:baseproject/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton(
      {Key? key, required this.icon, required this.onTap, this.iconColor})
      : super(key: key);
  final IconData icon;
  final VoidCallback onTap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colors.action,
        shape: CircleBorder(
          side: BorderSide(color: context.colors.primaryMain),
        ),
      ),
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          color: iconColor ?? context.colors.primaryMain,
        ),
      ),
    );
  }
}
