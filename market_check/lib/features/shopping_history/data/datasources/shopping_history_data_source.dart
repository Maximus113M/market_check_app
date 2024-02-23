import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/shared/models/user.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/config/services/server/server_service.dart';
import 'package:market_check/features/shopping_history/data/models/purchase_model.dart';

abstract class ShoppingHistoryDataSource {
  Future<List<PurchaseModel>> getShoppingHistory();
}

class ShoppingHistoryDataSourceImpl extends ShoppingHistoryDataSource {
  @override
  Future<List<PurchaseModel>> getShoppingHistory() async {
    try {
      final User? user = AuthService.user;
      List<PurchaseModel> purhaseList = [];
      if (user == null) return purhaseList;
      const String path =
          '${ServerUrls.purchaseUrl}${ServerUrls.shoppingHistoryUrl}';
      final response = await ServerService.serverGet(path);

      if (response.statusCode == 200) {
        purhaseList = (jsonDecode(response.body)["purchases"] as List)
            .map((purchaseJson) => PurchaseModel.fromJson(purchaseJson))
            .toList();
      }
      return purhaseList;
    } on HttpException catch (e) {
      debugPrint('ShoppingHistory httpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signInException);
    } catch (e) {
      debugPrint('ShoppingHistory httpException: $e');

      throw RemoteException(
          message: 'No se pudo obtener la lista',
          type: ExceptionType.shoppingHistoryException);
    }
  }
}
