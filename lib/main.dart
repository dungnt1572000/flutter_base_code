import 'package:baseproject/data/providers/theme_provider.dart';
import 'package:baseproject/data/services/network_service/network_action_manager.dart';
import 'package:baseproject/presentation/injection/app_modules.dart';
import 'package:baseproject/presentation/navigation/app_navigator_provider.dart';
import 'package:baseproject/presentation/navigation/app_router.dart';
import 'package:baseproject/presentation/navigation/app_routes.dart';
import 'package:baseproject/presentation/resources/app_theme.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:baseproject/presentation/injection/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';


List<CameraDescription> cameras = <CameraDescription>[];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppModules.inject();
  await injector.allReady();
  cameras = await availableCameras();
  injector
      .isReady<SharedPreferences>()
      .then((value) => runApp(const ProviderScope(
            child: MyApp(),
          )));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    injector.get<NetworkActionManager>().registerNavigateTo404NotFound(
      () async{
        await ref.read(appNavigatorProvider).navigateTo(AppRoutes.notFound404Error);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Project Name',
      theme: getAppTheme(Brightness.light),
      darkTheme: getAppTheme(Brightness.dark),
      themeMode: isDarkMode?ThemeMode.dark:ThemeMode.light,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRouter.onGenerateRoute,
      navigatorKey: ref.read(appNavigatorProvider).navigatorKey,
    );
  }
}
