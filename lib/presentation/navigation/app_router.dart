import 'package:baseproject/presentation/navigation/app_routes.dart';
import 'package:baseproject/presentation/pages/analyze_text/analyze_text_view.dart';
import 'package:baseproject/presentation/pages/home/home_view.dart';
import 'package:baseproject/presentation/pages/not_found_404_error/not_found_404_error_view.dart';
import 'package:baseproject/presentation/pages/obd/searching_obd_bluetooth/bluetooth_device_searching_view.dart';
import 'package:baseproject/presentation/pages/save_driving/save_driving_view.dart';
import 'package:baseproject/presentation/pages/splash/splash_view.dart';
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
          builder: (context) => const HomePage(),
        );
      case AppRoutes.notFound404Error:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const NotFound404ErrorView(),
        );
        case AppRoutes.saveDriving:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SaveDrivingView(),
        );
        case AppRoutes.analyzedTextScreen:
        final argument = settings.arguments as AnalyzeTextViewArgument;
        return MaterialPageRoute(
          settings: settings,
          builder: (context) =>  AnalyzeTextView(xFile: argument.xFile),
        );
      case AppRoutes.bluetoothScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const BluetoothDeviceSearchView(),
        );
      default:
        return null;
    }
  }
}
