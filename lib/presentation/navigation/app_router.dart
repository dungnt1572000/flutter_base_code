import 'package:baseproject/presentation/navigation/app_routes.dart';
import 'package:baseproject/presentation/pages/home/home_view.dart';
import 'package:baseproject/presentation/pages/not_found_404_error/not_found_404_error_view.dart';
import 'package:baseproject/presentation/pages/save_driving/save_driving_view.dart';
import 'package:baseproject/presentation/pages/splash/splash_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Approutes.splash:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SplashView(),
        );
      case Approutes.home:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HomePage(),
        );
      case Approutes.notFound404Error:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const NotFound404ErrorView(),
        );
        case Approutes.saveDriving:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SaveDrivingView(),
        );
      default:
        return null;
    }
  }
}
