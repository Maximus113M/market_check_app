import 'dart:math';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/remote_service/remote_urls.dart';

import 'package:dio/dio.dart';
import 'package:market_check/config/shared/models/user.dart';
import 'package:market_check/features/products/data/models/product_model.dart';

abstract class ProductsDataSource {
  Future<List<ProductModel>> getStoreProducts(int storeId);
}

class ProductsDataSourceImpl extends ProductsDataSource {
  final Dio dioGetStoreProducts = Dio(
    BaseOptions(
        baseUrl: "${RemoteUrls.currentUrl}${RemoteUrls.productsUrl}",
        headers: AuthService.headers),
  );
  
  @override
  Future<List<ProductModel>> getStoreProducts(int storeId) async {
    try {
      final User? user = AuthService.user;
      if (user == null) return [];
      List<ProductModel> products = [];
      final Response response = await dioGetStoreProducts.get(
        'store-products/$storeId',
      );
      products = (response.data["products"] as List)
          .map((productJson) => ProductModel.fromJson(productJson))
          .toList();

      return products.where((product) => product.state != 0).toList();
    } catch (e) {
      print(e);
      throw RemoteException(
          message: 'Ha ocurrido un error al consultar los productos.',
          type: ExceptionType.purchasesException);
    }
  }
}
