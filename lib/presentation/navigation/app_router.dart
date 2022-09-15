import 'package:baseproject/presentation/navigation/app_routes.dart';
import 'package:baseproject/presentation/pages/home/home_view.dart';
import 'package:baseproject/presentation/pages/splash/splash_view.dart';
import 'package:flutter/material.dart';

class AppRouter{
  static Route<dynamic>? onGenerateRoute(RouteSettings settings){
    switch (settings.name) {
      case Approutes.splash:

        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SplashView(), );
        case Approutes.home:
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => const HomeView(),);
      default:
      return null;
    }
  }
}