import 'package:baseproject/presentation/navigation/app_routes.dart';
import 'package:baseproject/presentation/pages/home/home_view.dart';
import 'package:baseproject/presentation/pages/login/login_view.dart';
import 'package:baseproject/presentation/pages/not_found_404_error/not_found_404_error_view.dart';
import 'package:baseproject/presentation/pages/register/register_view.dart';
import 'package:baseproject/presentation/pages/reset_password/reset_password.dart';
import 'package:baseproject/presentation/pages/splash/splash_view.dart';
import 'package:baseproject/presentation/pages/user_information/user_information_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SplashView(),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HomeView(),
        );
      case AppRoutes.notFound404Error:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const NotFound404ErrorView(),
        );
      case AppRoutes.login:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const LoginView(),
        );
      case AppRoutes.register:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const RegisterView(),
        );
      case AppRoutes.userInformation:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const UserInformationView(),
        );
      case AppRoutes.resetPassword:
        final argument = settings.arguments as ResetPasswordArgument;
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ResetPasswordView(argument: argument),
        );
      default:
        return null;
    }
  }
}
