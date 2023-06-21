import 'package:baseproject/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({Key? key, required this.title, this.leadingWidget})
      : super(key: key);
  final Widget title;
  final Widget? leadingWidget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: context.colors.backgroundPrimary,
      leading: leadingWidget,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);
}
