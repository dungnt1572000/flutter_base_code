import 'package:baseproject/presentation/pages/main_menu/main_menu_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainMenuViewModel extends StateNotifier<MainMenuState> {
  MainMenuViewModel() : super(MainMenuState());

  void changeTab(int index) {
    state = state.copyWith(currentTab: index);
  }
}
