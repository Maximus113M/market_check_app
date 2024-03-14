import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/config/services/server/server_service.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/products/data/models/products_by_category_model.dart';

import 'package:http/http.dart';

abstract class ProductsDataSource {
  Future<List<ProductModel>> getStoreProducts(int storeId);
  Future<List<ProductModel>> getProductsByCategorie(
      ProductsByCategoriesModel categoriesData);
}

class ProductsDataSourceImpl extends ProductsDataSource {
  final String dataSourceName= 'ProductsDataSourceImpl';
  @override
  Future<List<ProductModel>> getStoreProducts(int storeId) async {
    try {
      List<ProductModel> products = [];
      if (AuthService.user != null) {
        final response = await ServerService.serverGet(
            '${ServerUrls.productsUrl}${ServerUrls.storeProductsUrl}$storeId');

        if (response.statusCode != 200 && response.statusCode != 201) {
          throw HttpException(
              message: '${response.statusCode}, ${response.reasonPhrase}');
        }

        String? fixedResponse;
        if (!response.body.endsWith('}')) {
          fixedResponse = '${response.body}}';
        }

        products =
            (jsonDecode(fixedResponse ?? response.body)["products"] as List)
                .map((productJson) => ProductModel.fromJson(productJson))
                .toList();
        products.where((product) => product.state != 0).toList();
      }

      return products;
    } on HttpException catch (e) {
      debugPrint('$dataSourceName getStoreProducts httpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.products);
    } catch (e) {
      debugPrint('$dataSourceName getStoreProducts Exception: $e');
      throw RemoteException(
          message: 'Ha ocurrido un error al consultar los productos.',
          type: ExceptionType.products);
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategorie(
      ProductsByCategoriesModel categoriesData) async {
    try {
      List<ProductModel> products = [];
      if (AuthService.user != null) {
        final Response response = await ServerService.serverGet(
            '${ServerUrls.productsCategoriesUrl}${categoriesData.storeId}/${categoriesData.categorieId}');

        if (response.statusCode != 200 && response.statusCode != 201) {
          throw HttpException(
              message: '${response.statusCode}, ${response.reasonPhrase}');
        }

        String? fixedResponse;
        if (!response.body.endsWith('}')) {
          fixedResponse = '${response.body}}';
        }

        products =
            (jsonDecode(fixedResponse ?? response.body)['productos'] as List)
                .map((productJson) => ProductModel.fromJson(productJson))
                .toList();
      }
      return products;
    } on HttpException catch (e) {
      debugPrint('$dataSourceName getProductsByCategorie httpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.products);
    } catch (e) {
      debugPrint('$dataSourceName getProductsByCategorie Exception: $e');
      throw RemoteException(
          message:
              "Ha ocurrido un error al traer los productos de la categoria",
          type: ExceptionType.products);
    }
  }
}
