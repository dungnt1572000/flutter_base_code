import 'package:baseproject/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';

import '../resources/app_text_styles.dart';

void showInstructionDialog(BuildContext context, String content) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Text(content),
        icon: Row(
          children: [
            Icon(
              Icons.info_outline,
              color: context.colors.primaryMain,
            ),
            const SizedBox(
              width: 12,
            ),
            Text("Instruction",
                style: AppTextStyles.labelLarge
                    .copyWith(color: context.colors.primaryText)),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colors.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(color: context.colors.primaryMain),
              ),
            ),
            child: Text(
              'OK',
              style: AppTextStyles.labelMedium
                  .copyWith(color: context.colors.primaryText),
            ),
          )
        ],
      );
    },
  );
}
