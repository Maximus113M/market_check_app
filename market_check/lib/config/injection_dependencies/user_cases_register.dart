import 'package:market_check/injection_container.dart';
import 'package:market_check/features/login/domain/use_cases/sign_up_use_case.dart';
import 'package:market_check/features/login/domain/use_cases/sign_out_use_case.dart';
import 'package:market_check/features/offers/domain/use_cases/get_offers_use_case.dart';
import 'package:market_check/features/stores/domain/use_cases/get_stores_use_case.dart';
import 'package:market_check/features/login/domain/use_cases/verify_log_in_use_case.dart';
import 'package:market_check/features/categories/domain/use_cases/get_categories_use_case.dart';
import 'package:market_check/features/products/domain/use_cases/get_store_products_use_case.dart';
import 'package:market_check/features/login/domain/use_cases/verify_current_session_use_case.dart';

void registerUseCases() {
  sl.registerLazySingleton(
    () => VerifyCurrentSessionUseCase(
      signInRepostory: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => VerifyLogInUseCase(
      signInRepostory: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => SignUpUseCase(
      signInRepostory: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => SignOutUseCase(
      signInRepostory: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetOffersUseCase(
      offersRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetStoresUseCase(
      storesRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetStoreProductsUseCase(
      productsRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetCategoriesUseCase(
      categoriesRepository: sl(),
    ),
  );
}
