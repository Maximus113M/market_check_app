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
  Future<void> deleteShoppingList(int listId);
}

class ShoppingListsDatasorceImpl extends ShoppingListsDatasorce {
  @override
  Future<List<ShoppingListsModel>> getShoppingLists() async {
    try {
      List<ShoppingListsModel> userLists = [];

      final response = await ServerService.serverGet(ServerUrls.listsUrl);

      if (response.statusCode >= 300) {
        throw HttpException(
            message: '${response.statusCode}, ${response.reasonPhrase}');
      }

      userLists = (jsonDecode(response.body)['Listas del usuario'] as List)
          .map((jsonList) => ShoppingListsModel.fromJson(jsonList))
          .toList();

      return userLists;
    } on HttpException catch (e) {
      debugPrint('ShoppingListDatasource, getShoppingLists HttpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.shoppingLists);
    } catch (e) {
      debugPrint('ShoppingListDatasource, getShoppingLists Exception: $e');
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
        throw HttpException(
            message: '${response.statusCode}, ${response.reasonPhrase}');
      }

      final createdList =
          ShoppingListsModel.fromJson(jsonDecode(response.body)['lista']);

      return createdList;
    } on HttpException catch (e) {
      debugPrint(
          'ShoppingListDatasource, createShoppingLists HttpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.shoppingLists);
    } catch (e) {
      debugPrint('ShoppingListDatasource, createShoppingLists Exception: $e');
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
          '${ServerUrls.listsUrl}/${newList.id}', newList.shoppingListToJson());

      if (response.statusCode >= 300) {
        throw HttpException(
            message: '${response.statusCode}, ${response.reasonPhrase}');
      }
      final updateList =
          ShoppingListsModel.fromJson(jsonDecode(response.body)['lista']);

      return updateList;
    } on HttpException catch (e) {
      debugPrint(
          'ShoppingListDatasource, updateShoppingLists HttpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.shoppingLists);
    } catch (e) {
      debugPrint('ShoppingListDatasource, updateShoppingLists Exception: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo",
          type: ExceptionType.shoppingLists);
    }
  }

  @override
  Future<void> deleteShoppingList(int listId) async {
    try {
      final response =
          await ServerService.serverDelete('${ServerUrls.listsUrl}/$listId');

      if (response.statusCode >= 300) {
        throw HttpException(
            message: '${response.statusCode}, ${response.reasonPhrase}');
      }
    } on HttpException catch (e) {
      debugPrint(
          'ShoppingListDatasource, deleteShoppingLists HttpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.shoppingLists);
    } catch (e) {
      debugPrint('ShoppingListDatasource, deleteShoppingLists Exception: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo",
          type: ExceptionType.shoppingLists);
    }
  }
}
