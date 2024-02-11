import 'package:market_check/injection_container.dart';
import 'package:market_check/features/stores/data/datasources/stores_datasource.dart';
import 'package:market_check/features/offers/data/datasources/offers_datasource.dart';
import 'package:market_check/features/login/data/datasources/sign_in_data_source.dart';

void registerDataSources() {
  sl.registerLazySingleton<SignInDataSource>(
    () => SignInDataSourceImpl(),
  );
  sl.registerLazySingleton<OffersDataSource>(
    () => OffersDatasourceImpl(),
  );
  sl.registerLazySingleton<StoresDataSource>(
    () => StoresDataSourceImpl(),
  );
}