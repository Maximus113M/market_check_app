import 'dart:async';
import 'package:flutter/material.dart';

import 'package:market_check/config/utils/constans/in_app_notification.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/products/data/models/products_by_category_model.dart';
import 'package:market_check/features/products/domain/use_cases/get_product_by_categories_use_case.dart';
import 'package:market_check/features/products/domain/use_cases/get_store_products_use_case.dart';

import 'package:provider/provider.dart';

class ProductsProvider extends ChangeNotifier {
  final GetStoreProductsUseCase getStoreProductsUseCase;
  final GetProductsByCategorie getProductsByCategorie;
  List<ProductModel> products = [];
  List<ProductModel> productsByCategorie = [];
  List<ProductModel> filteredProductsList = [];
  StreamSubscription? searchTimer;
  TextEditingController searchTextController = TextEditingController();

  ProductsProvider(
      {required this.getStoreProductsUseCase,
      required this.getProductsByCategorie});

  void getProductsByStore(BuildContext context) async {
    final storeId = context.read<StoresProvider>().currentStore!.id;
    filteredProductsList.clear();
    final result = await getStoreProductsUseCase(storeId);

    result.fold(
        (l) => InAppNotification.serverFailure(
              context: context,
              message: l.message,
            ), (r) {
      products = r;
      filteredProductsList = r;
      notifyListeners();
    });
  }

  void getProductsByCategories(
      BuildContext context, ProductsByCategoriesModel params) async {
    filteredProductsList.clear();

    final result = await getProductsByCategorie(params);

    result.fold(
      (l) =>
          InAppNotification.serverFailure(context: context, message: l.message),
      (r) {
        productsByCategorie = r;
        filteredProductsList = r;

        notifyListeners();
      },
    );
  }

  List<ProductModel> getProductByName(String name) {
    return products.where((product) => product.name.contains(name)).toList();
  }

  void searchProducts(String name, SearchType type) async {
    List<ProductModel> currentList = [];
    switch (type) {
      case SearchType.categories:
        if (name.isEmpty) {
          filteredProductsList.addAll(productsByCategorie);
        }
        currentList .addAll(productsByCategorie);
        notifyListeners();
        break;
      case SearchType.products:
        if (name.isEmpty) {
          filteredProductsList.addAll(products);
        }
        currentList.addAll(products);
        notifyListeners();
        break;
      default:
        return;
    }

    searchTextController.text = name.toLowerCase();
    cancelSearchTimer();
    searchTimer = Stream<int>.periodic(
      const Duration(milliseconds: 500),
      (computationCount) => 1,
    ).take(1).listen((event) {
      filteredProductsList = currentList
          .where((product) =>
              product.name.toLowerCase().contains(searchTextController.text))
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

  void clearSearch(SearchType type) {
    searchTextController.clear();
    cancelSearchTimer();
    switch (type) {
      case SearchType.categories:
        filteredProductsList = productsByCategorie;

        notifyListeners();
        break;
      case SearchType.products:
        filteredProductsList = products;

        notifyListeners();
        break;
      default:
        return;
    }
    notifyListeners();
  }

  void restartFilterList() {
    productsByCategorie.clear();
    productsByCategorie.addAll(products);
    notifyListeners();
  }
}

enum SearchType { categories, products }
