import 'package:flutter/foundation.dart';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/shared/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/remote_service/remote_urls.dart';
import 'package:market_check/config/shared/models/create_user_data_model.dart';

import 'package:dio/dio.dart';

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
      final Response response = await dioInstance.put(
        '${RemoteUrls.userUrl}${AuthService.user!.id!}',
        data: updatedData.userToJson(),
      );

      if (response.statusCode == 201) {
        await flutterSecureStorage.write(key: 'name', value: updatedData.name);
        await flutterSecureStorage.write(
            key: 'documento', value: updatedData.document.toString());
        await flutterSecureStorage.write(
            key: 'email', value: updatedData.email);

        String? userId = await flutterSecureStorage.read(key: 'id');
        int? id;
        if (userId != null) {
          id = int.parse(userId);
        }
        AuthService.user = User(
          id: id,
          name: updatedData.name,
          document: updatedData.document.toString(),
          email: updatedData.email,
          rolId: 4,
        );
      }
      return response.data["message"];
    } on DioException catch (e) {
      debugPrint('$e');
      throw RemoteException(
          message:
              "Ocurrio un error al actualizar los datos, por favor intente de nuevo",
          type: ExceptionType.signInException);
    } catch (e) {
      throw RemoteException(
          message: "Ocurrio un error al actualizar los datos",
          type: ExceptionType.signInException);
    }
  }

  @override
  Future<String> deleteAccount() async {
    try {
      final Response response =
          await dioInstance.delete('/${AuthService.user!.id}');

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
