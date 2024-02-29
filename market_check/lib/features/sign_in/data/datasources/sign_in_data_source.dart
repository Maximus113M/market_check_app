import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/shared/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/config/services/server/server_service.dart';
import 'package:market_check/config/shared/models/create_user_data_model.dart';
import 'package:market_check/features/sign_in/data/models/sign_in_data_model.dart';
import 'package:market_check/features/shopping_history/data/models/purchase_model.dart';

abstract class SignInDataSource {
  Future<PurchaseModel?> verifyCurrentSession();
  Future<PurchaseModel?> verifyLogIn(SignInDataModel signInData);
  Future<String> signUp(SignUpDataModel newUser);
  Future<bool> signOut();
}

class SignInDataSourceImpl extends SignInDataSource {
  final FlutterSecureStorage flutterSecureStorage;

  SignInDataSourceImpl({required this.flutterSecureStorage});

  @override
  Future<PurchaseModel?> verifyCurrentSession() async {
    try {
      PurchaseModel? openPurchase;
      if (await flutterSecureStorage.containsKey(key: 'access_token')) {
        final currentSessionInfo = await flutterSecureStorage.readAll();
        AuthService.user = User.fromJson(currentSessionInfo, isEncripted: true);
        AuthService.token = currentSessionInfo["access_token"];
        AuthService.typeToken = currentSessionInfo["token_type"];

        debugPrint('${AuthService.token}');

        openPurchase = await getOpenPurchases();
        if (openPurchase != null) {
          AuthService.user!.isPurchaseOpen = true;
          AuthService.user!.purchasePin = openPurchase.pin;
        }
      }

      return openPurchase;
    } on HttpException catch (e) {
      debugPrint('VerifyCurrentSession httpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signInException);
    } catch (e) {
      debugPrint('VerifyCurrentSession Exception: $e');
      throw RemoteException(
          message: "Ocurrio un error al verificar la Sesión",
          type: ExceptionType.signInException);
    }
  }

  @override
  Future<PurchaseModel?> verifyLogIn(SignInDataModel signInData) async {
    try {
      final response = await ServerService.serverPost(ServerUrls.signInUrl,
          {"email": signInData.email, "password": signInData.password});

      PurchaseModel? openPurchase;
      if (response.statusCode == 200) {
        await flutterSecureStorage.write(
            key: 'id',
            value: jsonDecode(response.body)["user"]["id"].toString());
        await flutterSecureStorage.write(
            key: 'name', value: jsonDecode(response.body)["user"]["name"]);
        await flutterSecureStorage.write(
            key: 'documento',
            value: jsonDecode(response.body)["user"]["documento"].toString());
        await flutterSecureStorage.write(
            key: 'email', value: jsonDecode(response.body)["user"]["email"]);
        await flutterSecureStorage.write(
            key: 'access_token',
            value: jsonDecode(response.body)["access_token"]);
        await flutterSecureStorage.write(
            key: 'token_type', value: jsonDecode(response.body)["token_type"]);

        AuthService.user = User.fromJson(jsonDecode(response.body)["user"]);
        AuthService.token = jsonDecode(response.body)["access_token"];
        AuthService.typeToken = jsonDecode(response.body)["token_type"];

        openPurchase = await getOpenPurchases();
        if (openPurchase != null) {
          AuthService.user!.isPurchaseOpen = true;
          AuthService.user!.purchasePin = openPurchase.pin;
        }
      }

      return openPurchase;
    } on HttpException catch (e) {
      debugPrint('VerifyLogIn httpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signInException);
    } catch (e) {
      debugPrint('VerifyLogIn Exception: $e');
      throw RemoteException(
          message:
              "Revisa tus credenciales y asegurate de confirmar la notificación enviada a tu correo",
          type: ExceptionType.signInException);
    }
  }

  Future<PurchaseModel?> getOpenPurchases() async {
    try {
      PurchaseModel? openPurchase;
      const String path =
          '${ServerUrls.purchaseUrl}${ServerUrls.openShoppingHistoryUrl}';
      final response = await ServerService.serverGet(path);

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['openPurchase'] == null) {
          return null;
        }
        openPurchase =
            PurchaseModel.fromJson(jsonDecode(response.body)['openPurchase']);
      }

      return openPurchase;
    } on HttpException catch (e) {
      debugPrint('GetOpenPurchases httpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signInException);
    } catch (e) {
      debugPrint('GetOpenPurchases Exception: $e');
      throw RemoteException(
          message: "Ocurrio un error al obtener las compras pendientes",
          type: ExceptionType.signInException);
    }
  }

  @override
  Future<String> signUp(SignUpDataModel newUser) async {
    try {
      final response = await ServerService.serverPost(
          ServerUrls.signUpUrl, newUser.userToJson());
      if (response.statusCode == 201) {}
      print(jsonDecode(response.body));
      return 'Registro exito, ya puedes Iniciar Sesión!';
    } on HttpException catch (e) {
      debugPrint('SignUp httpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signInException);
    } catch (e) {
      debugPrint('SignUp Exception $e');
      throw RemoteException(
          message:
              "Ocurrio un error al relizar el registro, por favor intente de nuevo",
          type: ExceptionType.signInException);
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      if (AuthService.user != null) {
        ServerService.serverGet(ServerUrls.logOutUrl);
        AuthService.user = null;
        AuthService.token = null;
        AuthService.typeToken = null;
        await flutterSecureStorage.deleteAll();

        return true;
      }
      return false;
    } on HttpException catch (e) {
      debugPrint('SignOut httpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signInException);
    } catch (e) {
      debugPrint('SignOut Exception: $e');
      throw RemoteException(
        message: 'Ha ocurrido un error al cerrar la Sesion',
        type: ExceptionType.signInException,
      );
    }
  }
}
