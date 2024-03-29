import 'package:baseproject/data/providers/theme_provider.dart';
import 'package:baseproject/presentation/navigation/app_navigator_provider.dart';
import 'package:baseproject/presentation/navigation/app_routes.dart';
import 'package:baseproject/presentation/resources/app_colors.dart';
import 'package:baseproject/presentation/resources/app_images.dart';
import 'package:baseproject/presentation/resources/app_text_styles.dart';
import 'package:baseproject/presentation/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotFound404ErrorView extends ConsumerStatefulWidget {
  const NotFound404ErrorView({super.key});

  @override
  ConsumerState<NotFound404ErrorView> createState() =>
      _NotFound404ErrorViewState();
}

class _NotFound404ErrorViewState extends ConsumerState<NotFound404ErrorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _build404Image(),
            const SizedBox(
              height: 40,
            ),
            _buildContent(context),
            const SizedBox(
              height: 40,
            ),
            _buildBackButton(context),
            Switch(value: ref.watch(themeProvider), onChanged: (value) {
              setState(() {
                ref.read(themeProvider.notifier).update((state) => value);
              });
            },)
          ],
        ),
      ),
    );
  }

  Widget _build404Image() {
    return Image.asset(AppImages.notFound);
  }

  Widget _buildContent(BuildContext context) {
    return Text(
      'Error 404',
      style: AppTextStyles.headingSmall
          .copyWith(color: context.colors.textPrimary),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return AppButton(
      title: 'Back to Menu',
      buttonSize: ButtonSize.medium,
      isExpanded: true,
      onButtonTap: () {
        ref.read(appNavigatorProvider).popUntil(routeName: AppRoutes.home);
      },
    );
  }
}
