import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/shared/models/user.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/remote_service/remote_urls.dart';
import 'package:market_check/features/login/data/models/sign_in_data_model.dart';

import 'package:dio/dio.dart';
import 'package:market_check/features/login/data/models/sign_up_data_model.dart';

abstract class SignInDataSource {
  Future<bool> verifyLogIn(SignInDataModel signInData);
  Future<String> signUp(SignUpDataModel newUser);
}

class SignInDataSourceImpl extends SignInDataSource {
  final Dio dioLogIn = Dio(
    BaseOptions(
      baseUrl: "${RemoteUrls.baseUrlMovilSena}${RemoteUrls.authUrl}",
    ),
  );
  final Dio dioSignIn = Dio(
    BaseOptions(
      baseUrl: "${RemoteUrls.baseUrlMovilSena}${RemoteUrls.signUpUrl}",
    ),
  );

  SignInDataSourceImpl();

  @override
  Future<bool> verifyLogIn(SignInDataModel signInData) async {
    try {
      final Response response = await dioLogIn.post('',
          data: {"email": signInData.email, "password": signInData.password});
      print(response);
      print(response.data["user"]);

      AuthService.user = User.fromJson(response.data);
      AuthService.token = response.data["access_token"];
      AuthService.typeToken = response.data["token_type"];

      return true;
    } on DioException catch (e) {
      //TODO personalizar mensajes
      print(e);
      print(e.error);
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
  }

  @override
  Future<String> signUp(SignUpDataModel newUser) async {
    try {
      final Response response =
          await dioLogIn.post('', data: newUser.userToJson());
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
}
