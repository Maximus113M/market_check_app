import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/shared/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/remote_service/remote_urls.dart';
import 'package:market_check/config/shared/models/create_user_data_model.dart';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract class ProfileDataSource {
  Future<bool> updatePasword(String password);
  Future<String> deleteAccount();
  Future<String> updateAccountData(SignUpDataModel updatedData);
}

class ProfileDataSourceImpl extends ProfileDataSource {
  final FlutterSecureStorage flutterSecureStorage;

  final Dio dioInstance;

  ProfileDataSourceImpl(
      {required this.flutterSecureStorage, required this.dioInstance});

  @override
  Future<bool> updatePasword(String password) async {
    try {
      Response response = await dioInstance.put(
        '${RemoteUrls.userUrl}${AuthService.user!.id!}/change-password',
        data: {'password': password},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }

      return false;
    } catch (e) {
      print(e);
      throw RemoteException(
          message: "Ocurrio un error al actualizar la contraseña",
          type: ExceptionType.signInException);
    }
  }

  @override
  Future<String> updateAccountData(SignUpDataModel updatedData) async {
    try {
      /*final Response response = await dioInstance.put(
        '${RemoteUrls.userUrl}${AuthService.user!.id!}',
        data: updatedData.userToJson(),
      );*/
      //TODO TERMINAR
      var url = Uri.http(
          RemoteUrls.currentHttp, '/api/${RemoteUrls.userUrl}${AuthService.user!.id!}');
      
      var response = await http.put(
        url,
        headers: AuthService.headers,
        body: jsonEncode(
          updatedData.userToJson(),
        ),
      );

      if (response.statusCode == 201) {
        final User updatedUser = User.fromJson(
          jsonDecode(response.body)['user'],
        );
        AuthService.user = updatedUser;
        await flutterSecureStorage.write(key: 'name', value: updatedUser.name);
        await flutterSecureStorage.write(
            key: 'documento', value: updatedUser.document.toString());
        await flutterSecureStorage.write(
            key: 'email', value: updatedUser.email);
      }
      return jsonDecode(response.body)["message"];
    } on DioException catch (e) {
      debugPrint('$e');
      throw RemoteException(
          message:
              "Ocurrio un error al actualizar los datos, por favor intente de nuevo",
          type: ExceptionType.signInException);
    } catch (e) {
      print(e);
      throw RemoteException(
          message: "Ocurrio un error al actualizar los datos",
          type: ExceptionType.signInException);
    }
  }

  @override
  Future<String> deleteAccount() async {
    try {
      final Response response = await dioInstance
          .delete('${RemoteUrls.userUrl}${AuthService.user!.id}');

      await flutterSecureStorage.deleteAll();

      return response.data["message"];
    } on DioException catch (e) {
      print(e);
      throw RemoteException(
          message:
              "Ocurrio un error al eliminar la cuenta, por favor intentalo despues.",
          type: ExceptionType.signInException);
    } catch (e) {
      print(e);
      throw RemoteException(
          message:
              "Ocurrio un error al eliminar la cuenta, por favor intentalo despues.",
          type: ExceptionType.signInException);
    }
  }
}
