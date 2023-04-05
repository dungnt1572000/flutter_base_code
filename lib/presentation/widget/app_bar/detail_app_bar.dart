import 'package:baseproject/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';

class DetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailAppBar({Key? key, required this.title, this.onBackButton})
      : super(key: key);
  final String title;
  final VoidCallback? onBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: context.colors.textPrimary),
        onPressed: onBackButton,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
