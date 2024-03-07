import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/config/services/server/server_service.dart';
import 'package:market_check/features/categories/data/models/categories_model.dart';

abstract class CategoriesDataSource {
  Future<List<CategorieModel>> getCategories(int storeId);
}

class CategoriesDataSourceImpl extends CategoriesDataSource {
  @override
  Future<List<CategorieModel>> getCategories(int storeId) async {
    try {
      List<CategorieModel> categories = [];
      final String path = '${ServerUrls.categoriesUrlByStore}$storeId';

      final response = await ServerService.serverGet(path);

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw HttpException(
            message: '${response.statusCode}, ${response.reasonPhrase}');
      }

      String? fixedResponse;
      if (!response.body.endsWith('}')) {
        fixedResponse = '${response.body}}';
      }

      categories =
          (jsonDecode(fixedResponse ?? response.body)['categories'] as List)
              .map((categorieJson) => CategorieModel.fromJson(categorieJson))
              .toList();

      return categories;
    } on HttpException catch (e) {
      debugPrint('CategoriesDatasource, getCategories HttpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signIn);
    } catch (e) {
      debugPrint('CategoriesDatasource, getCategories Exception: $e');
      throw RemoteException(
          message: "Ha ocurrido un error al consultar las categorias",
          type: ExceptionType.purchases);
    }
  }
}
