import 'package:baseproject/presentation/navigation/app_navigator_provider.dart';
import 'package:baseproject/presentation/resources/app_text_styles.dart';
import 'package:baseproject/presentation/widget/app_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInformationView extends ConsumerStatefulWidget {
  const UserInformationView({Key? key}) : super(key: key);

  @override
  ConsumerState<UserInformationView> createState() =>
      _UserInformationViewState();
}

class _UserInformationViewState extends ConsumerState<UserInformationView> {
  final age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Column(
              children: [
                informationItem(title: 'Age', content: '13'),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: const [
                    Text('So bai viet dang'),
                    Spacer(),
                    Text('Sao:'),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          ref.read(appNavigatorProvider).goBack();
                        },
                        child: const Text('Back')),
                    const SizedBox(
                      width: 32,
                    ),
                    TextButton(onPressed: () {}, child: const Text('Modify')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget informationItem({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.headingMedium.copyWith(color: Colors.black),
        ),
        const AppDivider(),
        TextField(
          controller: age,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ],
    );
  }
}
