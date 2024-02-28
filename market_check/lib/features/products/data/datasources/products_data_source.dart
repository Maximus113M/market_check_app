import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/products/data/models/products_by_category_model.dart';

import 'package:dio/dio.dart';

abstract class ProductsDataSource {
  Future<List<ProductModel>> getStoreProducts(int storeId);
  Future<List<ProductModel>> getProductsByCategorie(
      ProductsByCategoriesModel categoriesData);
}

class ProductsDataSourceImpl extends ProductsDataSource {
  final Dio dioGetStoreProducts = Dio(
    BaseOptions(
        baseUrl: "${ServerUrls.currentUrl}${ServerUrls.productsUrl}",
        headers: AuthService.headers),
  );

  final Dio dioGetProductsCategories = Dio(
    BaseOptions(
        baseUrl: "${ServerUrls.currentUrl}${ServerUrls.productsCategoriesUrl}",
        headers: AuthService.headers),
  );

  @override
  Future<List<ProductModel>> getStoreProducts(int storeId) async {
    try {
      List<ProductModel> products = [];
      if (AuthService.user != null) {
        final Response response = await dioGetStoreProducts.get(
          'store-products/$storeId',
        );
        if (response.statusCode == 200) {
          products = (response.data["products"] as List)
              .map((productJson) => ProductModel.fromJson(productJson))
              .toList();
          return products.where((product) => product.state != 0).toList();
        }
      }
      return [];
    } catch (e) {
      print(e);
      throw RemoteException(
          message: 'Ha ocurrido un error al consultar los productos.',
          type: ExceptionType.purchasesException);
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategorie(
      ProductsByCategoriesModel categoriesData) async {
    try {
      List<ProductModel> products = [];
      if (AuthService.user != null) {
        final Response response = await dioGetStoreProducts.get(
            'productsCategories/${categoriesData.storeId}/${categoriesData.categorieId}');
        print(response.data);
        if (response.statusCode == 200) {
          return products = (response.data['productos'] as List)
              .map((productJson) => ProductModel.fromJson(productJson))
              .toList();
        }
      }
      return products;
    } catch (e) {
      print(e);
      throw RemoteException(
          message:
              "Ha ocurrido un error al traer los productos de la categoria",
          type: ExceptionType.productsException);
    }
  }
}
