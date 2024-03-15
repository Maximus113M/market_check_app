import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/features/profile_cards/domain/repositories/shopping_history_repository.dart';

import 'package:dartz/dartz.dart';

class GetStoresVisitedUseCase extends UseCase<List<StoreModel>, NoParams> {
  final ProfileCardsRepository profileRepository;

  GetStoresVisitedUseCase({required this.profileRepository});

  @override
  Future<Either<RemoteFailure, List<StoreModel>>> call(NoParams params) async =>
      await profileRepository.getStoresVisited();
}