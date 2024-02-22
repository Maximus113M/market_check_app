import 'package:dartz/dartz.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/errors/failures.dart';
import 'package:market_check/features/offers/data/datasources/offers_datasource.dart';
import 'package:market_check/features/offers/data/models/offer_model.dart';
import 'package:market_check/features/offers/domain/repositories/offer_repository.dart';

class OffersRepositoryImpl extends OffersRepository {
  final OffersDataSource offersDatasource;

  OffersRepositoryImpl({required this.offersDatasource});

  @override
  Future<Either<RemoteFailure, List<OfferModel>>> getOffers(int storeId) async {
    try {
      return Right(
        await offersDatasource.getOffers(storeId),
      );
    } on RemoteException catch (e) {
      return Left(
        RemoteFailure(
          message: e.message,
          type: ExceptionType.offersException,
        ),
      );
    }
  }
}
