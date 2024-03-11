import 'package:market_check/features/pending_purchases/data/repositories/pending_purchases_repository_impl.dart';
import 'package:market_check/features/pending_purchases/domain/repositories/pending_purchases_repository.dart';
import 'package:market_check/features/shopping_lists/data/repositories/shopping_lists_repository_impl.dart';
import 'package:market_check/features/shopping_lists/domain/repositories/shopping_lists_repository.dart';
import 'package:market_check/injection_container.dart';
import 'package:market_check/features/sign_in/domain/repositories/sign_in_repsitory.dart';
import 'package:market_check/features/stores/domain/repositories/store_repository.dart';
import 'package:market_check/features/profile/domain/repositories/profile_repository.dart';
import 'package:market_check/features/scanner/domain/repositories/scanner_repository.dart';
import 'package:market_check/features/sign_in/data/repositories/sign_in_repository_impl.dart';
import 'package:market_check/features/stores/data/repositories/stores_repository_impl.dart';
import 'package:market_check/features/products/domain/repositories/products_repository.dart';
import 'package:market_check/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:market_check/features/scanner/data/repositories/scanner_repository_impl.dart';
import 'package:market_check/features/shopping/domain/repositories/shopping_repository.dart';
import 'package:market_check/features/products/data/repositories/products_repository_impl.dart';
import 'package:market_check/features/categories/domain/repositories/categories_repository.dart';
import 'package:market_check/features/shopping/data/repositories/shopping_repository_impl.dart';
import 'package:market_check/features/categories/data/repositories/categories_repository_impl.dart';
import 'package:market_check/features/profile_cards/domain/repositories/shopping_history_repository.dart';
import 'package:market_check/features/profile_cards/data/repositories/profile_cards_repository_impl.dart';

void registerRepositories() {
  sl.registerLazySingleton<SignInRepostory>(
    () => SignInRepositoryImpl(
      signInDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<StoresRepository>(
    () => StoresRepositoryImpl(
      storesDatasource: sl(),
    ),
  );
  sl.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(
      productsDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepositoryImpl(
      categoriesDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      profileDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<ProfileCardsRepository>(
    () => ProfileCardsRepositoryImpl(
      profileCardsDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<ShoppingRepository>(
    () => ShoppingRepositoryImpl(
      purchasesDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<ScannerRepository>(
    () => ScannerRepositoryImpl(
      scannerDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<PendingPurchasesRepository>(
    () => PendingPurchasesRepositoryImpl(
      pendingPurchasesDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<ShoppingListsRepository>(
    () => ShoppingListsRepositoryImpl(
      shoppingListsDatasorce: sl(),
    ),
  );
}
