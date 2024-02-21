import 'dart:convert';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/shared/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/remote_service/remote_urls.dart';
import 'package:market_check/features/login/data/models/sign_in_data_model.dart';
import 'package:market_check/config/shared/models/create_user_data_model.dart';

import 'package:dio/dio.dart';

abstract class SignInDataSource {
  Future<bool> verifyCurrentSession();
  Future<bool> verifyLogIn(SignInDataModel signInData);
  Future<String> signUp(SignUpDataModel newUser);
  Future<bool> signOut();
}

class SignInDataSourceImpl extends SignInDataSource {
  final FlutterSecureStorage flutterSecureStorage;

  final Dio dioSignIn = Dio(
    BaseOptions(
      baseUrl: RemoteUrls.currentUrl,
    ),
  );

  SignInDataSourceImpl({required this.flutterSecureStorage});

  @override
  Future<bool> verifyCurrentSession() async {
    try {
      if (await flutterSecureStorage.containsKey(key: 'access_token')) {
        final currentSessionInfo = await flutterSecureStorage.readAll();
        AuthService.user = User.fromJson(currentSessionInfo, isEncripted: true);
        AuthService.token = currentSessionInfo["access_token"];
        AuthService.typeToken = currentSessionInfo["token_type"];

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

  @override
  Future<bool> verifyLogIn(SignInDataModel signInData) async {
    try {
      final Response response = await dioSignIn.post(RemoteUrls.signInUrl,
          data: {"email": signInData.email, "password": signInData.password});

      await flutterSecureStorage.write(
          key: 'id', value: response.data["user"]["id"].toString());
      await flutterSecureStorage.write(
          key: 'name', value: response.data["user"]["name"]);
      await flutterSecureStorage.write(
          key: 'documento',
          value: response.data["user"]["documento"].toString());
      await flutterSecureStorage.write(
          key: 'email', value: response.data["user"]["email"]);
      await flutterSecureStorage.write(
          key: 'access_token', value: response.data["access_token"]);
      await flutterSecureStorage.write(
          key: 'token_type', value: response.data["token_type"]);

      AuthService.user = User.fromJson(response.data["user"]);
      AuthService.token = response.data["access_token"];
      AuthService.typeToken = response.data["token_type"];

      return true;
    } on DioException catch (e) {
      print(e);
      String message = "";
      if (e.response!.statusCode == 401) {
        message =
            "Por favor revisa tus credenciales y asegurate de aceptar la confirmacion enviada a tu correo";
      }
      throw RemoteException(
          message: message, type: ExceptionType.signInException);
    } catch (e) {
      print(e);
      throw RemoteException(
          message: "Ocurrio un error al intentar iniciar Sesión",
          type: ExceptionType.signInException);
    }
  }

  @override
  Future<String> signUp(SignUpDataModel newUser) async {
    try {
      final Response response = await dioSignIn.post(RemoteUrls.signUpUrl,
          data: jsonEncode(newUser.userToJson()));
      print(response.data);
      return 'Registro exito, ya puedes Iniciar Sesión!';
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

  @override
  Future<bool> signOut() async {
    try {
      if (AuthService.user != null) {
        dioSignIn.get(RemoteUrls.logOutUrl);
        AuthService.user = null;
        AuthService.token = null;
        AuthService.typeToken = null;
        await flutterSecureStorage.deleteAll();

        return true;
      }
      return false;
    } catch (e) {
      print(e);
      throw RemoteException(
        message: 'Ha ocurrido un error al cerrar la Sesion',
        type: ExceptionType.signInException,
      );
    }
  }
}
