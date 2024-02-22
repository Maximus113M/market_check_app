import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/shared/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/config/services/server/server_service.dart';
import 'package:market_check/config/shared/models/create_user_data_model.dart';

abstract class ProfileDataSource {
  Future<bool> updatePasword(String password);
  Future<String> updateAccountData(SignUpDataModel updatedData);
  Future<String> deleteAccount();
}

class ProfileDataSourceImpl extends ProfileDataSource {
  final FlutterSecureStorage flutterSecureStorage;

  ProfileDataSourceImpl({required this.flutterSecureStorage});

  @override
  Future<bool> updatePasword(String password) async {
    try {
      final String path =
          '${ServerUrls.userUrl}${AuthService.user!.id!}/change-password';

      final response = await ServerService.serverPut(
        path,
        {'password': password},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }

      return false;
    } on HttpException catch (e) {
      debugPrint('$e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signInException);
    } catch (e) {
      debugPrint('$e');
      throw RemoteException(
          message: "Ocurrio un error al actualizar la contraseña",
          type: ExceptionType.signInException);
    }
  }

  @override
  Future<String> updateAccountData(SignUpDataModel updatedData) async {
    try {
      final String path = '${ServerUrls.userUrl}${AuthService.user!.id!}';

      var response = await ServerService.serverPut(
        path,
        updatedData.userToJson(),
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
    } on HttpException catch (e) {
      debugPrint('$e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signInException);
    } catch (e) {
      debugPrint('$e');
      throw RemoteException(
          message: "Ocurrio un error al actualizar los datos",
          type: ExceptionType.signInException);
    }
  }

  @override
  Future<String> deleteAccount() async {
    try {
      final String path = '${ServerUrls.userUrl}${AuthService.user!.id}';

      final response = await ServerService.serverDelete(path);

      if (response.statusCode == 200 || response.statusCode == 201) {
        await flutterSecureStorage.deleteAll();
      }

      return jsonDecode(response.body)["message"];
    } on HttpException catch (e) {
      debugPrint('$e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.signInException);
    } catch (e) {
      debugPrint('$e');
      throw RemoteException(
          message:
              "Ocurrio un error al eliminar la cuenta, por favor intentalo despues.",
          type: ExceptionType.signInException);
    }
  }
}
