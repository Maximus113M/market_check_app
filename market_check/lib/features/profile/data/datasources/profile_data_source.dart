import 'dart:convert';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/shared/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/remote_service/remote_urls.dart';
import 'package:market_check/features/login/data/models/sign_in_data_model.dart';
import 'package:market_check/config/shared/models/create_user_data_model.dart';

import 'package:dio/dio.dart';

abstract class ProfileDataSource {
  Future<bool> updatePasword(String password);
  //Future<bool> verifyLogIn(SignInDataModel signInData);
  Future<String> updateUserData(SignUpDataModel updatedData);
}

class ProfileDataSourceImpl extends ProfileDataSource {
  final FlutterSecureStorage flutterSecureStorage;

  final Dio dioInstance;

  ProfileDataSourceImpl(
      {required this.flutterSecureStorage, required this.dioInstance});

  @override
  Future<bool> updatePasword(String password) async {
    try {
      Response response = await dioInstance.get(RemoteUrls.userUrl);

      if (response.statusCode == 201) {
        return true;
      }

      return false;
    } catch (e) {
      print(e);
      throw RemoteException(
          message: "Ocurrio un error al verificar la Sesión",
          type: ExceptionType.signInException);
    }
  }

  /*@override
  Future<bool> verifyLogIn(SignInDataModel signInData) async {
    try {
      final Response response = await dioInstance.post(RemoteUrls.signInUrl,
          data: {"email": signInData.email, "password": signInData.password});
      print(response.data["user"]);

      await flutterSecureStorage.write(
          key: 'id', value: response.data["user"]["id"].toString());
      await flutterSecureStorage.write(
          key: 'name', value: response.data["user"]["name"]);
      await flutterSecureStorage.write(
          key: 'documento',
          value: response.data["user"]["documento"].toString());
      await flutterSecureStorage.write(
          key: 'email', value: response.data["user"]["email"]);

      AuthService.user = User.fromJson(response.data["user"]);
      AuthService.token = response.data["access_token"];
      AuthService.typeToken = response.data["token_type"];

      return true;
    } on DioException catch (e) {
      //TODO personalizar mensajes
      print(e);
      throw RemoteException(
          message:
              "Ocurrio un error al intentar ingresar, por favor revise sus credenciales",
          type: ExceptionType.signInException);
    } catch (e) {
      print(e);
      throw RemoteException(
          message: "Ocurrio un error al intentar iniciar Sesión",
          type: ExceptionType.signInException);
    }
  }*/

  @override
  Future<String> updateUserData(SignUpDataModel updatedData) async {
    try {
      final Response response = await dioInstance.put(
        RemoteUrls.userUrl,
        data: jsonEncode(
          updatedData.userToJson(isPasswordSet: false),
        ),
      );
      if (response.statusCode == 201) {
        await flutterSecureStorage.write(key: 'name', value: updatedData.name);
        await flutterSecureStorage.write(
            key: 'documento', value: updatedData.document.toString());
        await flutterSecureStorage.write(
            key: 'email', value: updatedData.email);
        AuthService.user = User(
          name: updatedData.name,
          document: updatedData.document.toString(),
          email: updatedData.email,
          rolId: 4,
        );
        print(response.data);
      }
      return response.data["message"];
    } on DioException catch (e) {
      //TODO personalizar mensajes
      print(e);
      throw RemoteException(
          message:
              "Ocurrio un error al relizar el registro, por favor intente de nuevo",
          type: ExceptionType.signInException);
    } catch (e) {
      print(e);
      throw RemoteException(
          message: "Ocurrio un error al realizar el registro",
          type: ExceptionType.signInException);
    }
  }
}
