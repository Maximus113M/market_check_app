import 'package:market_check/features/login/presentation/providers/sign_in_provider.dart';
import 'package:market_check/features/offers/presentation/providers/offer_provider.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/injection_container.dart';

void registerProviders() {
  sl.registerLazySingleton(
    () => SignInProvider(
      verifyLogInUseCase: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => StoresProvider(
      getStoresUseCase: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => OffersProvider(
      getOffersUseCase: sl(),
    ),
  );
}
