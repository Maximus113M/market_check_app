import 'package:market_check/features/pending_purchases/presentation/providers/pending_provider.dart';
import 'package:market_check/injection_container.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/sign_in/presentation/providers/sign_in_provider.dart';
import 'package:market_check/features/scanner/presentation/providers/scanner_provider.dart';
import 'package:market_check/features/profile/presentation/providers/profile_provider.dart';
import 'package:market_check/features/main_screen/presentation/providers/main_provider.dart';
import 'package:market_check/features/products/presentation/providers/products_provider.dart';
import 'package:market_check/features/shopping/presentation/providers/shopping_provider.dart';
import 'package:market_check/features/categories/presentation/providers/categories_provider.dart';
import 'package:market_check/features/shopping_lists/presentation/providers/shopping_list_provider.dart';
import 'package:market_check/features/shopping_history/presentation/providers/shopping_history_porvider.dart';

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
      getOffersUseCase: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => ProductsProvider(
      getStoreProductsUseCase: sl(),
      getProductsByCategorie: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => CategoriesProvider(
      getCategoriesUseCase: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => ShoppingProvider(
      createNewPurchaseUseCase: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => MainProvider(),
  );
  sl.registerLazySingleton(
    () => ProfileProvider(
      deleteAccountUseCase: sl(),
      updateAccountDataUseCase: sl(),
      updatePasswordUseCase: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => ShoppingHistoryProvider(
      getShoppinHistoryUseCase: sl(),
      getShoppingProductsUseCase: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => ScannerProvider(
      getStoreProductByScannerUseCase: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => ShoppingListsProvider(),
  );
  sl.registerLazySingleton(
    () => PendingProvider(
      getOpenPurchaseUseCase: sl(),
    ),
  );
}
