import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/remote_service/remote_urls.dart';

import 'package:dio/dio.dart';
import 'package:market_check/config/shared/models/user.dart';
import 'package:market_check/features/products/data/models/product_model.dart';

abstract class PurchasesDataSource {
  Future<bool> createNewPurchase(int storeId);
  Future<bool> addProductToPurchase(List<ProductModel> products);

  //Future<bool> addItemsToNewPurchase(List items);
  
}

class PurchasesDataSourceImpl extends PurchasesDataSource {
  final Dio dioNewPurchase = Dio(
    BaseOptions(
        baseUrl: "${RemoteUrls.currentUrl}${RemoteUrls.purchaseUrl}",
        headers: AuthService.headers),
  );

  @override
  Future<bool> createNewPurchase(int storeId) async {
    try {
      final User? user= AuthService.user;
      if (user == null) return false;
      final Response response =
          await dioNewPurchase.post('', data: {'establecimiento_id': storeId});
      final int pin= response.data["pin"];
      
      user.isPurchaseOpen= true;
      user.purchasePin= pin;

      return true;
    } catch (e) {
      throw RemoteException(
          message: 'Ha ocurrido un error al intentar crear la compra',
          type: ExceptionType.purchasesException);
    }
  }
  
  @override
  Future<bool> addProductToPurchase(List<ProductModel> products) async{
    // /{idCompra}/producto/{productoId}
    try {
      final User? user= AuthService.user;
      if (user == null) return false;
      final Response response =
          await dioNewPurchase.get('/{idCompra}/producto/{productoId}', data: {'establecimiento_id': storeId});
      final int pin= response.data["pin"];
      
      user.isPurchaseOpen= true;
      user.purchasePin= pin;

      return true;
    } catch (e) {
      throw RemoteException(
          message: 'Ha ocurrido un error al intentar crear la compra',
          type: ExceptionType.purchasesException);
    }
  }
}
