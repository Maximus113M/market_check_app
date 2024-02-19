import 'package:market_check/injection_container.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void registerFlutterSecureStorage() {
  sl.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    ),
  );
}
