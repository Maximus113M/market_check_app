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
      debugPrint('SignInDataSource, verifyCurrentSession HttpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signIn);
    } catch (e) {
      debugPrint('SignInDataSource, verifyCurrentSession Exception: $e');
      throw RemoteException(
          message: "Ocurrio un error al verificar la Sesión",
          type: ExceptionType.signIn);
    }
  }

  @override
  Future<PurchaseModel?> verifyLogIn(SignInDataModel signInData) async {
    try {
      final responseTemp = await ServerService.serverGet('images');
      responseTemp.body;

      final response = await ServerService.serverPost(ServerUrls.signInUrl,
          {"email": signInData.email, "password": signInData.password});

      PurchaseModel? openPurchase;

      if (response.statusCode == 401) {
        throw Exception();
      }

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw HttpException(
          message: '${response.statusCode}, ${response.reasonPhrase}',
        );
      }

      late String fixedResponse;
      if (!response.body.endsWith('}')) {
        fixedResponse = '${response.body}}';
      } else {
        fixedResponse = response.body;
      }

      await flutterSecureStorage.write(
          key: 'id', value: jsonDecode(fixedResponse)["user"]["id"].toString());
      await flutterSecureStorage.write(
          key: 'name', value: jsonDecode(fixedResponse)["user"]["name"]);
      await flutterSecureStorage.write(
          key: 'documento',
          value: jsonDecode(fixedResponse)["user"]["documento"].toString());
      await flutterSecureStorage.write(
          key: 'email', value: jsonDecode(fixedResponse)["user"]["email"]);
      await flutterSecureStorage.write(
          key: 'profile_image',
          value: ('${jsonDecode(fixedResponse)["user"]["profile_image"]}'));
      await flutterSecureStorage.write(
          key: 'access_token',
          value: jsonDecode(fixedResponse)["access_token"]);
      await flutterSecureStorage.write(
          key: 'token_type', value: jsonDecode(fixedResponse)["token_type"]);

      AuthService.user = User.fromJson(jsonDecode(fixedResponse)["user"]);
      AuthService.token = jsonDecode(fixedResponse)["access_token"];
      AuthService.typeToken = jsonDecode(fixedResponse)["token_type"];
      AuthService.headers = {
        'Content-Type': 'application/json',
        'Authorization': '${AuthService.typeToken} ${AuthService.token}'
      };

      openPurchase = await getOpenPurchases();
      if (openPurchase != null) {
        AuthService.user!.isPurchaseOpen = true;
        AuthService.user!.purchasePin = openPurchase.pin;
      }

      return openPurchase;
    } on HttpException catch (e) {
      debugPrint('SignInDataSource, verifyLogIn HttpException: $e');

      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signIn);
    } catch (e) {
      debugPrint('SignInDataSource, verifyLogIn Exception: $e');
      throw RemoteException(
          message:
              "Revisa tus credenciales y asegurate de confirmar la notificación enviada a tu correo",
          type: ExceptionType.signIn);
    }
  }

  Future<PurchaseModel?> getOpenPurchases() async {
    try {
      PurchaseModel? openPurchase;
      const String path =
          '${ServerUrls.purchaseUrl}${ServerUrls.openShoppingHistoryUrl}';

      final response = await ServerService.serverGet(path);

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw HttpException(
          message: '${response.statusCode}, ${response.reasonPhrase}',
        );
      }

      String? fixedResponse;
      if (!response.body.endsWith('}')) {
        fixedResponse = '${response.body}}';
      }

      if (jsonDecode(response.body)['openPurchase'] != null) {
        openPurchase = PurchaseModel.fromJson(
            jsonDecode(fixedResponse ?? response.body)['openPurchase']);
      }

      return openPurchase;
    } on HttpException catch (e) {
      debugPrint('SignInDataSource, getOpenPurchases HttpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signIn);
    } catch (e) {
      debugPrint('SignInDataSource, getOpenPurchases Exception: $e');
      throw RemoteException(
          message: "Ocurrio un error al obtener las compras pendientes",
          type: ExceptionType.signIn);
    }
  }

  @override
  Future<String> signUp(SignUpDataModel newUser) async {
    try {
      final response = await ServerService.serverPost(
          ServerUrls.signUpUrl, newUser.userToJson());

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw HttpException(
          message: '${response.statusCode}, ${response.reasonPhrase}',
        );
      }

      debugPrint(response.body);

      return 'Registro exitoso, Verifica la confirmación enviada a tu correo!';
    } on HttpException catch (e) {
      debugPrint('SignInDataSource, signUp HttpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signIn);
    } catch (e) {
      debugPrint('SignInDataSource, signUp Exception $e');
      throw RemoteException(
          message:
              "Ocurrio un error al relizar el registro, por favor intente de nuevo",
          type: ExceptionType.signIn);
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      if (AuthService.user != null) {
        final response = await ServerService.serverGet(ServerUrls.logOutUrl);

        if (response.statusCode != 200 && response.statusCode != 201) {
          throw HttpException(
            message: '${response.statusCode}, ${response.reasonPhrase}',
          );
        }

        AuthService.user = null;
        AuthService.token = null;
        AuthService.typeToken = null;
        await flutterSecureStorage.deleteAll();

        return true;
      }
      return false;
    } on HttpException catch (e) {
      debugPrint('SignInDataSource, signOut HttpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signIn);
    } catch (e) {
      debugPrint('SignInDataSource, signOut Exception: $e');
      throw RemoteException(
        message: 'Ha ocurrido un error al cerrar la Sesion',
        type: ExceptionType.signIn,
      );
    }
  }
}
