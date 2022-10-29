import 'package:baseproject/presentation/widget/app_indicator/app_lading_indicator.dart';
import 'package:baseproject/ultilities/loading_status.dart';
import 'package:flutter/material.dart';

class AppLoadingOverlay extends StatelessWidget {
  const AppLoadingOverlay({
    required this.child,
    required this.status,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final LoadingStatus status;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AbsorbPointer(
          absorbing: status == LoadingStatus.inProgress,
          child: child,
        ),
        Positioned.fill(
          child: Visibility(
            visible: status == LoadingStatus.inProgress,
            child: const AppLoadingIndicator(),
          ),
        ),
      ],
    );
  }
}
