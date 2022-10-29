import 'package:baseproject/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';

class RefreshView extends StatelessWidget {
  const RefreshView({
    required this.child,
    required this.onRefresh,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.color,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final RefreshCallback onRefresh;
  final ScrollNotificationPredicate notificationPredicate;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: color ?? context.colors.primaryMain,
      backgroundColor: Colors.transparent,
      onRefresh: onRefresh,
      notificationPredicate: notificationPredicate,
      child: child,
    );
  }
}
