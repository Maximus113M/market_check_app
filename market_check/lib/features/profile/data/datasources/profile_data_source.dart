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
  Future<void> updatePasword(String password);
  Future<String> updateAccountData(SignUpDataModel updatedData);
  Future<String> deleteAccount();
}

class ProfileDataSourceImpl extends ProfileDataSource {
  final FlutterSecureStorage flutterSecureStorage;

  ProfileDataSourceImpl({required this.flutterSecureStorage});

  @override
  Future<void> updatePasword(String password) async {
    try {
      final String path =
          '${ServerUrls.userUrl}${AuthService.user!.id!}${ServerUrls.changePasswordUrl}';

      final response = await ServerService.serverPut(
        path,
        {'password': password},
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw HttpException(
            message: '${response.statusCode}, ${response.reasonPhrase}');
      }
    } on HttpException catch (e) {
      debugPrint('ProfileDataSource, updatePasword HttpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.profile);
    } catch (e) {
      debugPrint('ProfileDataSource, updatePasword Exception: $e');
      throw RemoteException(
          message: "Ocurrio un error al actualizar la contraseña",
          type: ExceptionType.profile);
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

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw HttpException(
            message: '${response.statusCode}, ${response.reasonPhrase}');
      }
      String? fixedResponse;
      if (!response.body.endsWith('}')) {
        fixedResponse = '${response.body}}';
      }

      final User updatedUser = User.fromJson(
        jsonDecode(fixedResponse ?? response.body)['user'],
      );

      AuthService.user = updatedUser;
      await flutterSecureStorage.write(key: 'name', value: updatedUser.name);
      await flutterSecureStorage.write(
          key: 'documento', value: updatedUser.document.toString());
      await flutterSecureStorage.write(key: 'email', value: updatedUser.email);
      await flutterSecureStorage.write(
          key: 'profile_image', value: ('${updatedUser.profileImage}'));

      return jsonDecode(fixedResponse ?? response.body)["message"];
    } on HttpException catch (e) {
      debugPrint('ProfileDataSource, updateAccountData HttpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.profile);
    } catch (e) {
      debugPrint('ProfileDataSource, updateAccountData Exception: $e');
      throw RemoteException(
          message: "Ocurrio un error al actualizar los datos",
          type: ExceptionType.profile);
    }
  }

  @override
  Future<String> deleteAccount() async {
    try {
      final String path = '${ServerUrls.userUrl}${AuthService.user!.id}';

      final response = await ServerService.serverDelete(path);

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw HttpException(
            message: '${response.statusCode}, ${response.reasonPhrase}');
      }
      String? fixedResponse;
      if (!response.body.endsWith('}')) {
        fixedResponse = '${response.body}}';
      }

      await flutterSecureStorage.deleteAll();

      return jsonDecode(fixedResponse ?? response.body)["message"];
    } on HttpException catch (e) {
      debugPrint('ProfileDataSource, deleteAccount HttpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.profile);
    } catch (e) {
      debugPrint('ProfileDataSource, deleteAccount Exception: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al eliminar la cuenta, por favor intentalo despues.",
          type: ExceptionType.profile);
    }
  }
}
