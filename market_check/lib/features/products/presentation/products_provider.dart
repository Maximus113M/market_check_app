import 'package:flutter/material.dart';
import 'package:market_check/config/utils/constans/in_app_notification.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/products/domain/use_cases/get_store_products_use_case.dart';

class ProductsProvider extends ChangeNotifier {
  final GetStoreProductsUseCase getStoreProductsUseCase;
  List<ProductModel> products = [];
  ProductsProvider({required this.getStoreProductsUseCase});

  void getProductsByStore(BuildContext context, int storeId) async {
    final result = await getStoreProductsUseCase(storeId);

    result.fold(
      (l) => InAppNotification.serverFailure(
        context: context,
        message: l.message,
      ),
      (r) => products = r,
    );
    
  }

  List<ProductModel> getProductByName(String name){
    return products.where((product) => product.name.contains(name)).toList();
  }

}
