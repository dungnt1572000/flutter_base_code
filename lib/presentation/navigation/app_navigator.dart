import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// [AppNavigatorStackAction] is a action enum.
enum AppNavigatorStackAction {
  /// Keep all of stacks
  keep,

  /// Replace last stack
  replace,

  /// Remove all stacks
  removeAll,
}

enum AppFlow {
  main,
  home,
  notification,
  user,
}

/// [AppNavigator] is a navigator class which is used for page screen
/// transition.
class AppNavigator {
  final mainNavigationKey = GlobalKey<NavigatorState>();
  final homeNavigationKey = GlobalKey<NavigatorState>();
  final notificationNavigationKey = GlobalKey<NavigatorState>();
  final userNavigationKey = GlobalKey<NavigatorState>();

  NavigatorState? getCurrentState(AppFlow flow) {
    switch (flow) {
      case AppFlow.main:
        return mainNavigationKey.currentState;
      case AppFlow.home:
        return homeNavigationKey.currentState;
      case AppFlow.notification:
        return notificationNavigationKey.currentState;
      case AppFlow.user:
        return userNavigationKey.currentState;
    }
  }

  Future<dynamic> navigateTo(
    String routeName, {
    dynamic arguments,
    bool shouldClearStack = false,
    AppFlow appFlow = AppFlow.main,
  }) async {
    final currentState = getCurrentState(appFlow);
    if (currentState == null) {
      return false;
    }

    if (shouldClearStack) {
      /// Push the route with the given name onto the navigator, and then remove
      /// all the previous routes until the `predicate` returns true.
      ///
      return currentState.pushNamedAndRemoveUntil(
        routeName,
        (route) => false,
        arguments: arguments,
      );
    }

    /// Push a named route onto the navigator.
    ///
    return currentState.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  /// Get context.
  ///
  BuildContext? getContext({
    AppFlow appFlow = AppFlow.main,
  }) {
    final currentState = getCurrentState(appFlow);
    return currentState?.context;
  }

  /// Goes back to previous screen.
  ///
  void goBack({
    dynamic arguments,
    AppFlow appFlow = AppFlow.main,
  }) {
    final currentState = getCurrentState(appFlow);
    if (currentState == null) {
      return;
    }
    return currentState.pop(arguments);
  }

  /// Get can go back status.
  ///
  bool canGoBack({AppFlow appFlow = AppFlow.main}) {
    final currentState = getCurrentState(appFlow);
    if (currentState == null) {
      return false;
    }
    return currentState.canPop();
  }

  /// Removes all the screens on the stack until the given route name
  ///
  void popUntil({required String routeName, AppFlow appFlow = AppFlow.main}) {
    final currentState = getCurrentState(appFlow);
    if (currentState == null) {
      return;
    }

    final isCurrent = _isCurrent(
      routeName,
      currentState,
    );

    if (!isCurrent) {
      currentState.popUntil((route) => route.settings.name == routeName);
    }
  }

  bool _isCurrent(
    String routeName,
    NavigatorState currentState,
  ) {
    var isCurrent = false;

    currentState.popUntil((route) {
      if (route.settings.name == routeName) {
        isCurrent = true;
      }
      return true;
    });
    return isCurrent;
  }
}
