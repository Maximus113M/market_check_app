import 'package:market_check/injection_container.dart';
import 'package:market_check/features/products/presentation/products_provider.dart';
import 'package:market_check/features/offers/presentation/providers/offers_provider.dart';
import 'package:market_check/features/login/presentation/providers/sign_in_provider.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/profile/presentation/providers/profile_provider.dart';
import 'package:market_check/features/main_screen/presentation/providers/main_provider.dart';
import 'package:market_check/features/purchases/presentation/providers/shopping_cart_provider.dart';

void registerProviders() {
  sl.registerLazySingleton(
    () => SignInProvider(
      verifyCurrentSessionUseCase: sl(),
      verifyLogInUseCase: sl(),
      signUpUseCase: sl(),
      signOutUseCase: sl(),
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
  sl.registerLazySingleton(
    () => ProductsProvider(
      getStoreProductsUseCase: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => ShoppingCartProvider(),
  );
  sl.registerLazySingleton(
    () => MainProvider(),
  );
  sl.registerLazySingleton(
    () => ProfileProvider(),
  );
}
