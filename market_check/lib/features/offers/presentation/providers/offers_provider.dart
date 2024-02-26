import 'package:flutter/material.dart';

import 'package:market_check/features/offers/data/models/offer_model.dart';
import 'package:market_check/features/offers/domain/use_cases/get_offers_use_case.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';

import 'package:provider/provider.dart';

class OffersProvider with ChangeNotifier {
  final GetOffersUseCase getOffersUseCase;
  bool loadingOffers = false;
  List<OfferModel> offerList = [];
  OfferModel? currentOffer;
  

  OffersProvider({required this.getOffersUseCase});

  Future<void> loadOffers(BuildContext context,{ bool notify = true}) async {    
    loadingOffers = true;
    final storeId = context.read<StoresProvider>().currentStore!.id;
    final result = await getOffersUseCase(storeId);
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
