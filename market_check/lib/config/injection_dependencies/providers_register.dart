import 'package:market_check/features/shopping_cart/presentation/providers/shopping_cart_provider.dart';
import 'package:market_check/injection_container.dart';
import 'package:market_check/features/offers/presentation/providers/offers_provider.dart';
import 'package:market_check/features/login/presentation/providers/sign_in_provider.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';

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
    () => OfferssProvider(
      getOffersUseCase: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => ShoppingCartProvider(),
  );
}
