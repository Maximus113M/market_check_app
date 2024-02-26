import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/shared/models/user.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/features/shopping/data/models/shopping_cart_item_model.dart';

import 'package:dio/dio.dart';

abstract class ShoppingDataSource {
  Future<bool> createNewPurchase(List<ShoppingCartItemModel> purchaseItems);

  Future<void> addProductToPurchase(
      ShoppingCartItemModel purchaseItem, int purchaseId);
}

class PurchasesDataSourceImpl extends ShoppingDataSource {
  final Dio dioPurchaseBaseUrl = Dio(
    BaseOptions(
        baseUrl: "${ServerUrls.currentUrl}${ServerUrls.purchaseUrl}",
        headers: AuthService.headers),
  );

  @override
  Future<bool> createNewPurchase(
      List<ShoppingCartItemModel> purchaseItems) async {
    try {
      final User? user = AuthService.user;
      if (user == null) return false;
      if (purchaseItems.isNotEmpty) {
        final Response response = await dioPurchaseBaseUrl.post('new-purchase/',
            data: {'establecimiento_id': purchaseItems[0].product.storeId});
        if (response.statusCode == 201) {
          final int pin = response.data["pin"];
          final int purchaseId = response.data["id"];

          for (var item in purchaseItems) {
            await addProductToPurchase(item, purchaseId);
          }
          user.isPurchaseOpen = true;
          user.purchasePin = pin;

          return true;
        }
      }
      return false;
    } catch (e) {
      throw RemoteException(
          message: 'Ha ocurrido un error al intentar crear la compra',
          type: ExceptionType.purchasesException);
    }
  }

  @override
  Future<void> addProductToPurchase(
      ShoppingCartItemModel purchaseItem, int purchaseId) async {
    try {
      final Response response = await dioPurchaseBaseUrl.get(
          '$purchaseId/producto/${purchaseItem.product.id}',
          data: {'itemsCount': purchaseItem.quanty});
      print(response.data);
    } catch (e) {
      throw RemoteException(
          message: 'Ha ocurrido un error al agregar productos a la compra.',
          type: ExceptionType.purchasesException);
    }
  }
}
