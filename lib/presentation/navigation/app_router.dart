import 'package:baseproject/presentation/navigation/app_routes.dart';
import 'package:baseproject/presentation/pages/home/home_view.dart';
import 'package:baseproject/presentation/pages/not_found_404_error/not_found_404_error_view.dart';
import 'package:baseproject/presentation/pages/obd/obd_detail/obd_detail_view.dart';
import 'package:baseproject/presentation/pages/obd/searching_obd_bluetooth/bluetooth_device_searching_view.dart';
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
      case AppRoutes.bluetoothScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const BluetoothDeviceSearchView(),
        );
      case AppRoutes.obdDetail:
        final argument = settings.arguments as ObdDetailArgument;
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ObdDetailView(
            argument,
          ),
        );
      default:
        return null;
    }
  }
}
