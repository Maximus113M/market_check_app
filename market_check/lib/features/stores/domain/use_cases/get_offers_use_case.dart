import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/stores/data/models/offer_model.dart';
import 'package:market_check/features/stores/domain/repositories/store_repository.dart';

import 'package:dartz/dartz.dart';

class GetOffersUseCase extends UseCase<List<OfferModel>, int> {
  final StoresRepository storesRepository;

  GetOffersUseCase({required this.storesRepository});

  @override
  Future<Either<RemoteFailure, List<OfferModel>>> call(int params) async {
    return await storesRepository.getOffers(params);
  }
}
