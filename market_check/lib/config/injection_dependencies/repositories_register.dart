import 'package:market_check/injection_container.dart';
import 'package:market_check/features/login/domain/repositories/sign_in_repsitory.dart';
import 'package:market_check/features/login/data/repositories/sign_in_repository_impl.dart';
import 'package:market_check/features/offers/domain/repositories/offer_repository.dart';
import 'package:market_check/features/offers/data/repositories/offers_repository_impl.dart';
import 'package:market_check/features/stores/domain/repositories/store_repository.dart';
import 'package:market_check/features/stores/data/repositories/stores_repository_impl.dart';

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
  sl.registerLazySingleton<OffersRepository>(
    () => OffersRepositoryImpl(
      offersDatasource: sl(),
    ),
  );
}
