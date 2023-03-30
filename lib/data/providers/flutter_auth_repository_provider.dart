import 'package:baseproject/data/services/preference_services/shared_preferences_manager.dart';
import 'package:baseproject/presentation/injection/injector.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/firebase_auth_repository.dart';

final flutterAuthRepositoryProvider = Provider(
  (ref) => FlutterAuthRepository(
    injector.get<SharePreferencesManager>(),
  ),
);
