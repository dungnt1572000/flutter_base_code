import 'dart:core';

import 'package:baseproject/presentation/navigation/app_navigator_provider.dart';
import 'package:baseproject/presentation/navigation/app_router.dart';
import 'package:baseproject/presentation/navigation/app_routes.dart';
import 'package:baseproject/presentation/pages/main_menu/main_menu_state.dart';
import 'package:baseproject/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main_menu_view_model.dart';
import 'model/main_tab_enum.dart';

final mainMenuProvider =
    StateNotifierProvider.autoDispose<MainMenuViewModel, MainMenuState>(
  (ref) => MainMenuViewModel(),
);

class MainMenuView extends ConsumerStatefulWidget {
  const MainMenuView({Key? key}) : super(key: key);

  @override
  ConsumerState<MainMenuView> createState() => _MainMenuViewState();
}

class _MainMenuViewState extends ConsumerState<MainMenuView> {
  final controller = PageController(initialPage: MainTab.home.index);

  MainMenuViewModel get viewModel => ref.read(mainMenuProvider.notifier);

  MainMenuState get state => ref.read(mainMenuProvider);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
        controller: controller,
        children: body(),
      )),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: context.colors.primaryMain,
        selectedFontSize: 15,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
            ),
            label: 'Notification'
          ),
          BottomNavigationBarItem(
            label: 'User',
            icon: Icon(
              Icons.account_circle,
            ),
          ),
        ],
        currentIndex: ref.watch(mainMenuProvider).currentTab,
        onTap: (value) {
          viewModel.changeTab(value);
          controller.jumpToPage(value);
        },
      ),
    );
  }

  List<Widget> body() {
    return MainTab.values.map((e) {
      switch (e) {
        case MainTab.home:
          return Navigator(
            initialRoute: AppRoutes.home,
            key: ref.read(appNavigatorProvider).homeNavigationKey,
            onGenerateRoute: AppRouter.onGenerateRoute,
          );
        case MainTab.notification:
          return Navigator(
            initialRoute: AppRoutes.notification,
            key: ref.read(appNavigatorProvider).notificationNavigationKey,
            onGenerateRoute: AppRouter.onGenerateRoute,
          );
        case MainTab.user:
          return Navigator(
            initialRoute: AppRoutes.userInformation,
            key: ref.read(appNavigatorProvider).userNavigationKey,
            onGenerateRoute: AppRouter.onGenerateRoute,
          );
      }
    }).toList();
  }
}
