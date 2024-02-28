import 'dart:async';
import 'package:flutter/material.dart';

import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/stores/data/models/offer_model.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/features/stores/domain/use_cases/get_offers_use_case.dart';
import 'package:market_check/features/stores/domain/use_cases/get_stores_use_case.dart';

import 'package:provider/provider.dart';

class StoresProvider with ChangeNotifier {
  final GetStoresUseCase getStoresUseCase;
  final GetOffersUseCase getOffersUseCase;
  bool loadingOffers = false;
  List<OfferModel> offerList = [];
  OfferModel? currentOffer;

  bool loadingStores = false;
  List<StoreModel> storeList = [];
  List<StoreModel> filteredStoreList = [];
  TextEditingController searchTextController = TextEditingController();
  StoreModel? currentStore;
  StreamSubscription? searchTimer;

  StoresProvider(
      {required this.getOffersUseCase, required this.getStoresUseCase});

  Future<void> loadStores(BuildContext context, {notify = true}) async {
    context.read<StoresProvider>().currentStore = currentStore;
    loadingStores = true;
    final result = await getStoresUseCase(NoParams());
    loadingStores = false;

    result.fold((l) => null, (r) {
      storeList = r;
      filteredStoreList = storeList;
    });
    if (notify) notifyListeners();
  }

  void searchStores(String name) async {
    if (name.isEmpty) {
      filteredStoreList = storeList;
      notifyListeners();
    }
    searchTextController.text = name.toLowerCase();
    cancelSearchTimer();
    searchTimer = Stream<int>.periodic(
      const Duration(milliseconds: 500),
      (computationCount) => 1,
    ).take(1).listen(
      (event) {
        filteredStoreList = storeList
            .where((store) =>
                store.name.toLowerCase().contains(searchTextController.text))
            .toList();
        notifyListeners();
      },
    );
  }

  void clearSearch() {
    searchTextController.clear();
    cancelSearchTimer();
    filteredStoreList = storeList;
    notifyListeners();
  }

  void cancelSearchTimer() {
    if (searchTimer != null) {
      searchTimer!.cancel();
      searchTimer = null;
    }
  }

  Future<void> loadOffers(BuildContext context, {bool notify = true}) async {
    loadingOffers = true;
    final storeId = context.read<StoresProvider>().currentStore!.id;
    final result = await getOffersUseCase(storeId);

    result.fold(
      (l) => null,
      (r) => offerList = r,
    );
    if (notify) notifyListeners();

    loadingOffers = false;
    currentOffer = null;

    // notifyListeners();
  }
}
