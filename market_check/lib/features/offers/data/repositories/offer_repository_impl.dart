import 'package:dartz/dartz.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/features/offers/data/datasources/offer_datasource.dart';
import 'package:market_check/features/offers/domain/entities/offer_entity.dart';
import 'package:market_check/features/offers/domain/repositories/offer_repository.dart';

class OfferRepositoryImpl extends OfferRepository {
  //Recibe implementacion de OfferDBDatasource
  final OffersDBDatasource offersDatasource;
  OfferRepositoryImpl(this.offersDatasource);

  @override
  Future<Either<Failure, List<OfferEntity>>> getOffers() async {
    try {
      return Right(
        await offersDatasource.getOffers(),
      );
    } on OffersException catch (e) {
      return Left(
        OffersFailure(message: e.message),
      );
    }
  }
}
