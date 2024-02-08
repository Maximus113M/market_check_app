import 'package:flutter/foundation.dart';

import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/offers/data/models/offer_model.dart';
import 'package:market_check/features/offers/domain/use_cases/get_offers_use_case.dart';

class OfferssProvider with ChangeNotifier {
  final GetOffersUseCase getOffersUseCase;
  bool loadingOffers = false;
  List<OfferModel> offerList = [];
  OfferModel? currentOffer;

  OfferssProvider({required this.getOffersUseCase});

  Future<void> loadOffers({bool notify = true}) async {
    
    
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
