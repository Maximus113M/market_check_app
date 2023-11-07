import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/offers/domain/entities/offer_entity.dart';
import 'package:market_check/features/offers/domain/repositories/offer_repository.dart';

import 'package:dartz/dartz.dart';

class GetOffersUseCase extends UseCase<List<OfferEntity>, NoParams> {
  final OfferRepository offersRepository;

  GetOffersUseCase(this.offersRepository);

  @override
  Future<Either<Failure, List<OfferEntity>>> call(params) async =>
      await offersRepository.getOffers();
}
