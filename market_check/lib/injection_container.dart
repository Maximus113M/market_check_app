import 'package:get_it/get_it.dart';
import 'package:market_check/features/offers/data/datasources/offer_datasource.dart';
import 'package:market_check/features/offers/domain/repositories/offer_repository.dart';
import 'package:market_check/features/offers/domain/use_cases/get_offers_use_case.dart';
import 'package:market_check/features/offers/presentation/providers/offer_provider.dart';
import 'package:market_check/features/offers/data/repositories/offer_repository_impl.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';

final GetIt sl = GetIt.instance;

init() async {
  registerSingletons();
  registerFirebase();
  registerDataSources();
  registerRepositories();
  registerUseCases();
  registerProvider();
}

void registerProvider() {
  sl.registerFactory(
    () => OfferProvider(
      sl(),
    ),
  );
  sl.registerFactory(
    () => StoresProvider(
      sl(),
    ),
  );
}

void registerUseCases() {
  sl.registerLazySingleton(
    () => GetOffersUseCase(
      sl(),
    ),
  );
}

void registerRepositories() {
  // sl.registerLazySingleton<HomeRepository>(
  //   () => HomeRepositoryImpl(
  //     homeDataSource: sl(),
  //   ),
  // );
  sl.registerLazySingleton<OfferRepository>(
    () => OfferRepositoryImpl(
      sl(),
    ),
  );
}

void registerDataSources() {
  // sl.registerLazySingleton<HomeDataSource>(
  //   () => HomeDataSourceImpl(),
  // );
  sl.registerLazySingleton<OfferDatasource>(
    () => OffersDBDatasource(),
  );
}

void registerSingletons() async {
  // sl.registerLazySingleton<UserData>(() => UserData());
}

void registerFirebase() {
  //sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
}
