import 'package:baseproject/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 3.5,
        ),
        Divider(
          height: 1,
          color: context.colors.primaryMain.withOpacity(0.4),
        ),
        const SizedBox(
          height: 3.5,
        )
      ],
    );
  }
}
