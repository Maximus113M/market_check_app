import 'package:flutter/foundation.dart';

import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/offers/domain/entities/offer_entity.dart';
import 'package:market_check/features/offers/data/datasources/offer_datasource.dart';
import 'package:market_check/features/offers/domain/use_cases/get_offers_use_case.dart';
import 'package:market_check/features/offers/data/repositories/offer_repository_impl.dart';

class OfferProvider with ChangeNotifier {
  OfferRepositoryImpl offerRepository =
      OfferRepositoryImpl(OffersDBDatasource());

  late GetOffersUseCase getOffersUseCase;
  bool loadingOffers = false;
  List<OfferEntity> offerList = [];
  OfferEntity? currentOffer;

  // OfferProvider(this.getOffersUseCase);

  Future<void> loadOffers({bool notify = true}) async {
    getOffersUseCase = GetOffersUseCase(offerRepository);
    loadingOffers = true;
    final result = await getOffersUseCase(NoParams());
    print("---------------------> ahhhhhhhhhhhhhhhhhhhhhhhhhh");
    result.fold(
      (l) => null,
      (r) => offerList = r,
    );
    if (notify) notifyListeners();
    //await Future.delayed(const Duration(seconds: 2));

    loadingOffers = false;
    currentOffer = null;

    // notifyListeners();
  }

  void getOffers() {
    //loadOffers();
    //notifyListeners();
    //return offerList;
  }
}
