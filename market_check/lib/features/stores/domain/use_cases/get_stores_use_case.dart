import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/features/stores/domain/repositories/store_repository.dart';

import 'package:dartz/dartz.dart';

class GetStoresUseCase extends UseCase<List<StoreModel>, NoParams> {
  final StoresRepository storesRepository;

  GetStoresUseCase({required this.storesRepository});

  @override
  Future<Either<Failure, List<StoreModel>>> call(NoParams params) async =>
      await storesRepository.getStores();
}
