import 'package:dio/dio.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/config/shared/models/user.dart';
import 'package:market_check/features/shopping_history/data/models/purchase_model.dart';

abstract class SoppingHistoryDataSource {
  Future<List<PurchaseModel>> getShoppingHistory();
}

class SoppingHistoryDataSourceImpl extends SoppingHistoryDataSource {
  final Dio dioGetShoppingHistory = Dio(
    BaseOptions(
        baseUrl: "${ServerUrls.currentUrl}${ServerUrls.shoppingHistoryUrl}",
        headers: AuthService.headers),
  );

  @override
  Future<List<PurchaseModel>> getShoppingHistory() async {
    try {
      final User? user = AuthService.user;
      if (user == null) return <PurchaseModel>[];
      final Response response = await dioGetShoppingHistory.get('');
      final List<PurchaseModel> purhaseList = response.data["purchases"]
          .map((purchaseJson) => PurchaseModel.fromJson(purchaseJson))
          .toList();
      return purhaseList;
    } catch (e) {
      throw RemoteException(
          message: 'No se pudo obtener la lista',
          type: ExceptionType.shoppingHistoryException);
    }
  }
}
