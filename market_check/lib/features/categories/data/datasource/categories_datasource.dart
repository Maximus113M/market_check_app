import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/config/services/server/server_service.dart';
import 'package:market_check/features/categories/data/models/categories_model.dart';

import 'package:dio/dio.dart';

abstract class CategoriesDataSource {
  Future<List<CategorieModel>> getCategories(int storeId);
}

class CategoriesDataSourceImpl extends CategoriesDataSource {
  final Dio dioGetCategories = Dio(
    BaseOptions(
        baseUrl: "${ServerUrls.currentUrl}${ServerUrls.categoriesUrl}",
        headers: AuthService.headers),
  );

  final Dio dioGetCategoriesByStore = Dio(
    BaseOptions(
        baseUrl: "${ServerUrls.currentUrl}${ServerUrls.categoriesUrlByStore}",
        headers: AuthService.headers),
  );

  @override
  Future<List<CategorieModel>> getCategories(int storeId) async {
    try {
      List<CategorieModel> categories = [];
      if (AuthService.user != null) {
        final String path = '${ServerUrls.categoriesUrlByStore}$storeId';

        final response = await ServerService.serverGet(path);

        if (response.statusCode == 200) {
          categories = (jsonDecode(response.body)['categories'] as List)
              .map((categorieJson) => CategorieModel.fromJson(categorieJson))
              .toList();
          return categories;
        }
      }
      return [];
    } on HttpException catch (e) {
      debugPrint('Categories httpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signInException);
    } catch (e) {
      debugPrint('Categories Exception: $e');
      throw RemoteException(
          message: "Ha ocurrido un error al consultar las categorias",
          type: ExceptionType.purchasesException);
    }
  }
}
