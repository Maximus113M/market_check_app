import 'dart:async';

import 'package:flutter/material.dart';
import 'package:market_check/config/utils/constans/in_app_notification.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/products/data/models/products_by_category_model.dart';
import 'package:market_check/features/products/domain/use_cases/get_product_by_categories_use_case.dart';
import 'package:market_check/features/products/domain/use_cases/get_store_products_use_case.dart';

class ProductsProvider extends ChangeNotifier {
  final GetStoreProductsUseCase getStoreProductsUseCase;
  final GetProductsByCategorie getProductsByCategorie;
  List<ProductModel> products = [];
  List<ProductModel> filteredProductsList = [];
  StreamSubscription? searchTimer;
  TextEditingController searchTextController = TextEditingController();

  ProductsProvider({required this.getStoreProductsUseCase, required this.getProductsByCategorie});

  void getProductsByStore(BuildContext context, int storeId) async {
    final result = await getStoreProductsUseCase(storeId);

    result.fold(
        (l) => InAppNotification.serverFailure(
              context: context,
              message: l.message,
            ), (r) {
      products = r;
      filteredProductsList = products;
    });
  }

  void getProductsByCategories(BuildContext context, ProductsByCategoriesModel params) async{
    final result = await getProductsByCategorie(params);

    result.fold(
      (l) => InAppNotification.serverFailure(context: context, message: l.message), 
      (r) => products = r);
      notifyListeners();
  }



  List<ProductModel> getProductByName(String name) {
    return products.where((product) => product.name.contains(name)).toList();
  }

  void searchProducts(String name) async {
    if (name.isEmpty) {
      filteredProductsList = products;
      notifyListeners();
    }
    searchTextController.text = name.toLowerCase();
    cancelSearchTimer();
    searchTimer = Stream<int>.periodic(
      const Duration(milliseconds: 500),
      (computationCount) => 1,
    ).take(1).listen((event) {
      filteredProductsList = products
          .where((products) =>
              products.name.toLowerCase().contains(searchTextController.text))
          .toList();
      notifyListeners();
    });
  }

  void cancelSearchTimer() {
    if (searchTimer != null) {
      searchTimer!.cancel();
      searchTimer = null;
    }
  }

  void clearSearch(){
    searchTextController.clear();
    cancelSearchTimer();
    filteredProductsList = products;
    notifyListeners();
  }
}
