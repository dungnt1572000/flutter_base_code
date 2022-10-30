import 'package:baseproject/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasicAppBar extends ConsumerStatefulWidget implements PreferredSizeWidget {
  const BasicAppBar(
      {super.key,
      this.title,
      this.widgets,
      required this.shouldShowBackButton,
      this.onBackButtonTap});

  final Widget? title;
  final List<Widget>? widgets;
  final bool shouldShowBackButton;
  final VoidCallback? onBackButtonTap;

  const BasicAppBar.onlyTitle({
    required this.title,
    this.shouldShowBackButton = false,
    this.onBackButtonTap,
    this.widgets,
    Key? key,
  }) : super(key: key);

  const BasicAppBar.titleAndButton({
    required this.title,
    this.shouldShowBackButton = true,
    this.onBackButtonTap,
    this.widgets,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<BasicAppBar> createState() => _BasicAppBarState();
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _BasicAppBarState extends ConsumerState<BasicAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: widget.title,
        actions: widget.widgets,
        backgroundColor: context.colors.backgroundPrimary.withOpacity(0.0),
        centerTitle: true,
        elevation: 0,
        leading: widget.shouldShowBackButton
            ? IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: context.colors.textPrimary,
                ),
              )
            : null,
            
            );
  }
}
