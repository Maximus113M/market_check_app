import 'dart:convert';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/remote_service/remote_urls.dart';
import 'package:market_check/features/categories/data/models/categories_model.dart';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract class CategoriesDataSource {
  Future<List<CategorieModel>> getCategories(int storeId);
}

class CategoriesDataSourceImpl extends CategoriesDataSource {
  final Dio dioGetCategories = Dio(
    BaseOptions(
        baseUrl: "${RemoteUrls.currentUrl}${RemoteUrls.categoriesUrl}",
        headers: AuthService.headers),
  );

  final Dio dioGetCategoriesByStore = Dio(
    BaseOptions(
        baseUrl: "${RemoteUrls.currentUrl}${RemoteUrls.categoriesUrlByStore}",
        headers: AuthService.headers),
  );

  @override
  Future<List<CategorieModel>> getCategories(int storeId) async {
    try {
      List<CategorieModel> categories = [];
      if (AuthService.user != null) {
        //final Response response = await dioGetCategoriesByStore.get('$storeId');
        //TODO MODELO DE HTTP
        var url = Uri.http(RemoteUrls.currentHttp,
            '/api/${RemoteUrls.categoriesUrlByStore}$storeId');

        var response = await http.get(
          url,
          headers: AuthService.headers,
        );

        print(response);
        if (response.statusCode == 200) {
          categories = ( jsonDecode(response.body)['categories'] as List)
              .map((categorieJson) => CategorieModel.fromJson(categorieJson))
              .toList();
          return categories;
        }
      }
      return [];
    } catch (e) {
      print(e);
      throw RemoteException(
          message: "Ha ocurrido un error al consultar las categorias",
          type: ExceptionType.purchasesException);
    }
  }
}
