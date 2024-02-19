import 'package:dio/dio.dart';
import 'package:market_check/config/services/remote_service/remote_urls.dart';
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
  sl.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: RemoteUrls.currentUrl,
      ),
    ),
  );
}
