import 'package:market_check/injection_container.dart';
import 'package:market_check/features/sign_in/domain/use_cases/sign_up_use_case.dart';
import 'package:market_check/features/sign_in/domain/use_cases/sign_out_use_case.dart';
import 'package:market_check/features/stores/domain/use_cases/get_offers_use_case.dart';
import 'package:market_check/features/stores/domain/use_cases/get_stores_use_case.dart';
import 'package:market_check/features/sign_in/domain/use_cases/verify_log_in_use_case.dart';
import 'package:market_check/features/profile/domain/use_cases/delete_account_use_case.dart';
import 'package:market_check/features/profile/domain/use_cases/update_password_use_case.dart';
import 'package:market_check/features/categories/domain/use_cases/get_categories_use_case.dart';
import 'package:market_check/features/profile/domain/use_cases/update_account_data_use_case.dart';
import 'package:market_check/features/products/domain/use_cases/get_store_products_use_case.dart';
import 'package:market_check/features/sign_in/domain/use_cases/verify_current_session_use_case.dart';
import 'package:market_check/features/shopping/domain/use_cases/create_new_purchase_use_case.dart';
import 'package:market_check/features/shopping_history/domain/use_cases/get_shopping_products_use_case.dart';
import 'package:market_check/features/products/domain/use_cases/get_product_by_categories_use_case.dart';
import 'package:market_check/features/scanner/domain/use_cases/get_store_product_by_scanner_use_case.dart';
import 'package:market_check/features/shopping_history/domain/use_cases/get_shopping_history_use_case.dart';

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
      storesRepository: sl(),
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
    () => GetProductsByCategorie(
      productsRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetCategoriesUseCase(
      categoriesRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => DeleteAccountUseCase(
      profileRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => UpdateAccountDataUseCase(
      profileRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => UpdatePasswordUseCase(
      profileRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetShoppinHistoryUseCase(
      shoppingHistoryRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => CreateNewPurchaseUseCase(
      purchasesRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetShoppingProductsUseCase(
      shoppingHistoryRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetStoreProductByScannerUseCase(
      scannerRepository: sl(),
    ),
  );
}
