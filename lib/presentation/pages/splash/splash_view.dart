import 'package:baseproject/presentation/navigation/app_navigator_provider.dart';
import 'package:baseproject/presentation/navigation/app_routes.dart';
import 'package:baseproject/presentation/resources/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => ref.read(appNavigatorProvider).navigateTo(
            AppRoutes.home,
            shouldClearStack: true,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.deepPurple,
                Colors.deepPurpleAccent,
                Colors.purpleAccent,
                Colors.pinkAccent
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: const Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(
                  AppImages.appLogo,
                ),
              ),
            )));
  }
}
