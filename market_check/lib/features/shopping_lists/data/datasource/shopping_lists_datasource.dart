import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/server/server_service.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/features/shopping_lists/data/models/shopping_lists_model.dart';

abstract class ShoppingListsDatasorce {
  Future<ShoppingListsModel> createShoppingList(ShoppingListsModel newList);
}

class ShoppingListsDatasorceImpl extends ShoppingListsDatasorce {
  @override
  Future<ShoppingListsModel> createShoppingList(ShoppingListsModel newList) async {
    try {
      final response = await ServerService.serverPost(
          ServerUrls.listsUrl,  newList.shoppingListJson());
          if(response.statusCode == 201){}
          return newList;
    } catch (e) {
      throw RemoteException(message: "Ocurrio un error al conectarse al servidor, intente de nuevo", type: ExceptionType.shoppingListsException);
    }
  }
}

