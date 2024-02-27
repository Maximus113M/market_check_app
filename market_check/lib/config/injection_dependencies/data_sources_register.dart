import 'package:market_check/injection_container.dart';
import 'package:market_check/features/stores/data/datasources/stores_datasource.dart';
import 'package:market_check/features/sign_in/data/datasources/sign_in_data_source.dart';
import 'package:market_check/features/profile/data/datasources/profile_data_source.dart';
import 'package:market_check/features/scanner/data/datasources/scanner_data_source.dart';
import 'package:market_check/features/shopping/data/datasources/shopping_data_source.dart';
import 'package:market_check/features/products/data/datasources/products_data_source.dart';
import 'package:market_check/features/categories/data/datasource/categories_datasource.dart';
import 'package:market_check/features/shopping_history/data/datasources/shopping_history_data_source.dart';

void registerDataSources() {
  sl.registerLazySingleton<SignInDataSource>(
    () => SignInDataSourceImpl(
      flutterSecureStorage: sl(),
    ),
  );
  sl.registerLazySingleton<StoresDataSource>(
    () => StoresDataSourceImpl(),
  );
  sl.registerLazySingleton<ProductsDataSource>(
    () => ProductsDataSourceImpl(),
  );
  sl.registerLazySingleton<CategoriesDataSource>(
    () => CategoriesDataSourceImpl(),
  );
  sl.registerLazySingleton<ProfileDataSource>(
    () => ProfileDataSourceImpl(
      flutterSecureStorage: sl(),
    ),
  );
  sl.registerLazySingleton<ShoppingHistoryDataSource>(
    () => ShoppingHistoryDataSourceImpl(),
  );
  sl.registerLazySingleton<ShoppingDataSource>(
    () => PurchasesDataSourceImpl(),
  );
  sl.registerLazySingleton<ScannerDataSource>(
    () => ScannerDataSourceImpl(),
  );
}
