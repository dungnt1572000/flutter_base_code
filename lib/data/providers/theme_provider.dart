import 'package:baseproject/presentation/injection/injector.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/use_case/get_app_theme_use_case.dart';

final themeProvider = StateProvider<bool>(
  (ref) => injector.get<GetAppThemeUseCase>().run(),
);
