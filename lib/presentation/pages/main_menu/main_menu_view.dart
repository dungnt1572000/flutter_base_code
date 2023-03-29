import 'dart:core';
import 'dart:core';

import 'package:baseproject/presentation/pages/main_menu/main_menu_state.dart';
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

  final controller = PageController(
      initialPage: MainTab.home.index,
      keepPage: true
  );

  MainMenuViewModel get viewModel => ref.read(mainMenuProvider.notifier);

  MainMenuState get state => ref.read(mainMenuProvider);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: PageView(
        children:[],
        controller: controller,
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: state.currentTab,
        onTap: (value) => viewModel.changeTab(value),
      ),
    );
  }

  final items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(Icons.notifications), label: 'Notification'),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'User'),
  ];

}
