import 'package:market_check/config/services/auth/user.dart';
import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/remote_service/remote_urls.dart';
import 'package:market_check/features/login/data/models/sign_in_data_model.dart';

import 'package:dio/dio.dart';

abstract class SignInDataSource {
  Future<bool> verifyLogIn(SignInDataModel signInData);
}

class SignInDataSourceImpl extends SignInDataSource {
  final Dio dio = Dio(BaseOptions(
      baseUrl: "${RemoteUrls.baseUrlMovilSena}${RemoteUrls.authUrl}"));

  SignInDataSourceImpl();

  @override
  Future<bool> verifyLogIn(SignInDataModel signInData) async {
    try {
      final Response response = await dio.post('',
          data: {"email": signInData.email, "password": signInData.password});
      print(response.data["user"]);
      final User user = User.fromJson(response.data);

      AuthService.user = user;

      return true;
    } on DioException catch (e) {
      //TODO personalizar mensajes
      print(e);
      throw RemoteException(
          message: "Ocurrio un error, por favor revise sus credenciales",
          type: ExceptionType.signInException);
    } catch (e) {
      print(e);
      throw RemoteException(
          message: "Ocurrio un error al intentar iniciar Sesión",
          type: ExceptionType.signInException);
    }
  }
}
