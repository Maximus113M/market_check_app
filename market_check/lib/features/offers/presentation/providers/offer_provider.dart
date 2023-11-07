import 'package:flutter/foundation.dart';

import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/offers/domain/entities/offer_entity.dart';
import 'package:market_check/features/offers/domain/use_cases/get_offers_use_case.dart';

class OfferProvider with ChangeNotifier {
  GetOffersUseCase getOffersUseCase;
  bool loadingOffers = false;
  List<OfferEntity> offerList = [];

  OfferProvider(this.getOffersUseCase);

  void loadOffers() async {
    loadingOffers = true;
    final result = await getOffersUseCase(NoParams());
    print("---------------------> ahhhhhhhhhhhhhhhhhhhhhhhhhh");

    result.fold(
      (l) => null,
      (r) => offerList = r,
    );
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    loadingOffers = false;
    notifyListeners();
  }

  void getOffers() {
    //loadOffers();
    //notifyListeners();
    //return offerList;
  }
}
