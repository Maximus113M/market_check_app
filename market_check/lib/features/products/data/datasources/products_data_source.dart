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
  @override
  Future<List<ProductModel>> getStoreProducts(int storeId) async {
    try {
      List<ProductModel> products = [];
      if (AuthService.user != null) {
        final response = await ServerService.serverGet(
            '${ServerUrls.productsUrl}${ServerUrls.storeProductsUrl}$storeId');

        if (response.statusCode >= 300) {
          throw HttpException(
              message: '${response.statusCode}, ${response.reasonPhrase}');
        }

        products = (jsonDecode(response.body)["products"] as List)
            .map((productJson) => ProductModel.fromJson(productJson))
            .toList();
        products.where((product) => product.state != 0).toList();
      }
      return products;
    } on HttpException catch (e) {
      debugPrint('getStoreProducts httpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signIn);
    } catch (e) {
      debugPrint('getStoreProducts Exception: $e');
      throw RemoteException(
          message: 'Ha ocurrido un error al consultar los productos.',
          type: ExceptionType.purchases);
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

        debugPrint(response.body);

        if (response.statusCode >= 300) {
          throw HttpException(
              message: '${response.statusCode}, ${response.reasonPhrase}');
        }

        products = (jsonDecode(response.body)['productos'] as List)
            .map((productJson) => ProductModel.fromJson(productJson))
            .toList();
      }
      return products;
    } on HttpException catch (e) {
      debugPrint('getProductsByCategorie httpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signIn);
    } catch (e) {
      debugPrint('getProductsByCategorie Exception: $e');
      throw RemoteException(
          message:
              "Ha ocurrido un error al traer los productos de la categoria",
          type: ExceptionType.products);
    }
  }
}
