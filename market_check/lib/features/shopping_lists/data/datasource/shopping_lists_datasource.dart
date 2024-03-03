import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/config/services/server/server_service.dart';
import 'package:market_check/features/shopping_lists/data/models/shopping_lists_model.dart';

abstract class ShoppingListsDatasorce {
  Future<List<ShoppingListsModel>> getShoppingLists();
  Future<ShoppingListsModel> createShoppingList(ShoppingListsModel newList);
  Future<ShoppingListsModel> updateShoppingList(ShoppingListsModel newList);
  Future<void> deleteShoppingList(int newList);
}

class ShoppingListsDatasorceImpl extends ShoppingListsDatasorce {
  @override
  Future<List<ShoppingListsModel>> getShoppingLists() async {
    try {
      final response = await ServerService.serverGet(ServerUrls.listsUrl);
      if (response.statusCode == 201) {
        print(jsonDecode(response.body));
      }
      return [];
    } catch (e) {
      debugPrint('$e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo",
          type: ExceptionType.shoppingLists);
    }
  }

  @override
  Future<ShoppingListsModel> createShoppingList(
      ShoppingListsModel newList) async {
    try {
      final response = await ServerService.serverPost(
          ServerUrls.listsUrl, newList.shoppingListToJson());
      if (response.statusCode >= 300) {
        throw HttpException(message: '${jsonDecode(response.body)['message']}');
      }
      //TODO DEVOLVER LA DE LA DB
      jsonDecode(response.body)[''];
      return newList;
    } catch (e) {
      debugPrint('$e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo",
          type: ExceptionType.shoppingLists);
    }
  }

  @override
  Future<ShoppingListsModel> updateShoppingList(
      ShoppingListsModel newList) async {
    try {
      final response = await ServerService.serverPut(
          '${ServerUrls.listsUrl}/2', newList.shoppingListToJson());
      if (response.statusCode == 201) {
        //TODO DEVOLVER LO DE LA DB
        return newList;
      }
      throw UnimplementedError();
    } catch (e) {
      debugPrint('$e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo",
          type: ExceptionType.shoppingLists);
    }
  }

  @override
  Future<void> deleteShoppingList(int newList) {
    // TODO: implement deleteShoppingList
    throw UnimplementedError();
  }
}
