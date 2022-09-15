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

/// [AppNavigator] is a navigator class which is used for page screen
/// transition.
class AppNavigator {
  final navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(
    String routeName, {
    dynamic arguments,
    bool shouldClearStack = false,
  }) async {
    final currentState = navigatorKey.currentState;
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
  BuildContext? getContext() {
    final currentState = navigatorKey.currentState;
    return currentState?.context;
  }

  /// Goes back to previous screen.
  ///
  void goBack({
    dynamic arguments,
  }) {
    final currentState = navigatorKey.currentState;
    if (currentState == null) {
      return;
    }
    return currentState.pop(arguments);
  }

  /// Get can go back status.
  ///
  bool canGoBack() {
    final currentState = navigatorKey.currentState;
    if (currentState == null) {
      return false;
    }
    return currentState.canPop();
  }

  /// Removes all the screens on the stack until the given route name
  ///
  void popUntil({
    required String routeName,
  }) {
    final currentState = navigatorKey.currentState;
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
