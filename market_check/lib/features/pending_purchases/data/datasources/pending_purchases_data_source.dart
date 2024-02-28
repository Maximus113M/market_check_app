import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/config/services/server/server_service.dart';
import 'package:market_check/features/shopping_history/data/models/purchase_model.dart';

abstract class PendingPurchasesDataSource {
  Future<PurchaseModel?> getOpenPurchase();
}

class PendingPurchasesDataSourceImpl extends PendingPurchasesDataSource {
  @override
  Future<PurchaseModel?> getOpenPurchase() async {
    try {
      PurchaseModel? openPurchase;
      const String path =
          '${ServerUrls.purchaseUrl}${ServerUrls.openShoppingHistoryUrl}';
      final response = await ServerService.serverGet(path);

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['openPurchase'] == null) {
          AuthService.user!.isPurchaseOpen = false;
          AuthService.user!.purchasePin = null;
          return null;
        }

        openPurchase =
            PurchaseModel.fromJson(jsonDecode(response.body)['openPurchase']);

        AuthService.user!.isPurchaseOpen = true;
        AuthService.user!.purchasePin = openPurchase.pin;
      }

      return openPurchase;
    } on HttpException catch (e) {
      debugPrint('GetOpenPurchase httpException: $e');
      throw RemoteException(
        message:
            "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
        type: ExceptionType.pendingPurchasesException,
      );
    } catch (e) {
      debugPrint('GetOpenPurchase Exception: $e');
      throw RemoteException(
        message: "Ocurrio un error al obtener las compras pendientes",
        type: ExceptionType.pendingPurchasesException,
      );
    }
  }
}
