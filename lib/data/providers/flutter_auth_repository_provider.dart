import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/firebase_auth_repository.dart';

final flutterAuthRepository = Provider((ref) => FlutterAuthRepository());