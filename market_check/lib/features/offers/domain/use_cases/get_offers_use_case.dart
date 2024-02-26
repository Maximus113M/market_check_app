import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/offers/data/models/offer_model.dart';
import 'package:market_check/features/offers/domain/repositories/offer_repository.dart';

import 'package:dartz/dartz.dart';

class GetOffersUseCase extends UseCase<List<OfferModel>, int> {
  final OffersRepository offersRepository;

  GetOffersUseCase({required this.offersRepository});
  
  @override
  Future<Either<RemoteFailure, List<OfferModel>>> call(int params) async{
    return await offersRepository.getOffers(params);
  }

  
}
