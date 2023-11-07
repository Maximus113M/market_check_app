import 'package:dartz/dartz.dart';
import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/stores/domain/entities/store_entity.dart';
import 'package:market_check/features/stores/domain/repositories/store_repository.dart';

class GetStoresUseCase extends UseCase<List<StoreEntity>, NoParams> {
  final StoreRepository storeRepository;

  GetStoresUseCase(this.storeRepository);

  @override
  Future<Either<Failure, List<StoreEntity>>> call(NoParams params) async =>
      await storeRepository.getStores();
}
