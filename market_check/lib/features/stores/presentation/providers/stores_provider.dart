import 'package:flutter/material.dart';

import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/features/stores/domain/use_cases/get_stores_use_case.dart';

class StoresProvider with ChangeNotifier {
  GetStoresUseCase getStoresUseCase;
  bool loadingStores = false;
  List<StoreModel> storeList = [];
  StoreModel? currentStore;

  StoresProvider({required this.getStoresUseCase});

  Future<void> loadStores({notify = true}) async {
    loadingStores = true;
    final result = await getStoresUseCase(NoParams());
    loadingStores = false;

    result.fold((l) => null, (r) => storeList = r);
    if (notify) notifyListeners();
    //currentStore = null;
  }
}
