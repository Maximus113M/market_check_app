import 'dart:async';
import 'package:flutter/material.dart';

import 'package:market_check/config/utils/constans/in_app_notification.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/products/data/models/products_by_category_model.dart';
import 'package:market_check/features/products/domain/use_cases/get_store_products_use_case.dart';
import 'package:market_check/features/products/domain/use_cases/get_product_by_categories_use_case.dart';

import 'package:provider/provider.dart';

class ProductsProvider extends ChangeNotifier {
  final GetStoreProductsUseCase getStoreProductsUseCase;
  final GetProductsByCategorie getProductsByCategorie;
  List<ProductModel> products = [];
  List<ProductModel> filteredProducts = [];
  List<ProductModel> productsByCategorie = [];
  List<ProductModel> filteredCategoriesProducts = [];
  StreamSubscription? searchTimer;
  TextEditingController searchTextController = TextEditingController();
  bool isLoading = false;

  SearchType currentSearchType = SearchType.categories;

  ProductsProvider(
      {required this.getStoreProductsUseCase,
      required this.getProductsByCategorie});

  void getProductsByStore(BuildContext context) async {
    if (isLoading) return;
    isLoading = true;
    final storeId = context.read<StoresProvider>().currentStore!.id;

    filteredProducts.clear();
    final result = await getStoreProductsUseCase(storeId);

    result.fold(
      (l) => InAppNotification.serverFailure(
        context: context,
        message: l.message,
      ),
      (r) {
        products = [...r];
        filteredProducts = [...r];
      },
    );
    isLoading = false;
    notifyListeners();
  }

  void getProductsByCategories(
      BuildContext context, ProductsByCategoriesModel params) async {
    if (isLoading) return;
    isLoading = true;

    filteredCategoriesProducts.clear();
    notifyListeners();

    final result = await getProductsByCategorie(params);

    result.fold(
      (l) =>
          InAppNotification.serverFailure(context: context, message: l.message),
      (r) {
        productsByCategorie = [...r];
        filteredCategoriesProducts = [...r];
      },
    );

    isLoading = false;
    notifyListeners();
  }

  void setCurrentSearchType(SearchType type) {
    currentSearchType = type;
    notifyListeners();
  }

  //TODO REVISAR
  /*List<ProductModel> getProductByName(String name) {
    return products.where((product) => product.name.contains(name)).toList();
  }*/

  void searchProducts(String name) async {
    searchTextController.text = name.toLowerCase();

    switch (currentSearchType) {
      case SearchType.categories:
        if (name.isEmpty) {
          filteredCategoriesProducts.clear();
          filteredCategoriesProducts = [...productsByCategorie];
        }

        filterProducts(productsByCategorie);
        notifyListeners();

        break;
      case SearchType.products:
        if (name.isEmpty) {
          filteredProducts.clear();
          filteredProducts = [...products];
        }
        filterProducts(products);
        break;
      default:
        return;
    }
  }

  void filterProducts(List<ProductModel> originalList) {
    List<ProductModel> currentList = [...originalList];
    cancelSearchTimer();

    searchTimer = Stream<int>.periodic(
      const Duration(milliseconds: 500),
      (countValue) => 1,
    ).take(1).listen((event) {
      switch (currentSearchType) {
        case SearchType.categories:
          filteredCategoriesProducts = currentList
              .where((product) => product.name
                  .toLowerCase()
                  .contains(searchTextController.text))
              .toList();

          break;
        case SearchType.products:
          filteredProducts = currentList
              .where((product) => product.name
                  .toLowerCase()
                  .contains(searchTextController.text))
              .toList();

          break;
        default:
          return;
      }

      notifyListeners();
    });
  }

  void cancelSearchTimer() {
    if (searchTimer != null) {
      searchTimer!.cancel();
      searchTimer = null;
    }
  }

  void clearSearch() {
    searchTextController.clear();
    cancelSearchTimer();
    switch (currentSearchType) {
      case SearchType.categories:
        filteredCategoriesProducts = [...productsByCategorie];

        notifyListeners();
        break;
      case SearchType.products:
        filteredProducts = [...products];

        notifyListeners();
        break;
      default:
        filteredProducts = [];
        return;
    }
  }

  void clearSearchText() {
    searchTextController.clear();
    if (currentSearchType == SearchType.products) {
      filteredProducts = [...products];
    }
    notifyListeners();
  }

  /*void restartProductList() {
    filteredProducts.clear();
    filteredProducts = [...products];
    notifyListeners();
  }*/
}

enum SearchType { categories, products }
