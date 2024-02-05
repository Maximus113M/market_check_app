import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/utils/constans/in_app_notification.dart';
import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/login/data/datasources/sign_in_data_source.dart';
import 'package:market_check/features/login/data/models/sign_in_data_model.dart';
import 'package:market_check/features/login/data/repositories/sign_in_repository_impl.dart';
import 'package:market_check/features/login/domain/repositories/sign_in_repsitory.dart';
import 'package:market_check/features/login/domain/use_cases/verify_log_in_use_case.dart';

class LoginProvider with ChangeNotifier {
  //TODO ARREGLAR AL USAR INYECCION DE DEPENDENCIAS
  VerifyLogInUseCase verifyLogInUseCase = VerifyLogInUseCase(
    signInRepostory: SignInRepositoryImpl(
      signInDataSource: SignInDataSourceImpl(),
    ),
  );
  String emailInput = '';
  String passwordInput = '';

  void validateUser(BuildContext context) async {
    if (emailInput.trim().isEmpty ||
        !AppFuntions.emailRegExp.hasMatch(emailInput)) {
      return;
    }
    if (passwordInput.contains(" ") ||
        passwordInput.isEmpty ||
        passwordInput.length < 6) {
      return;
    }
    print(passwordInput);
    final SignInDataModel signInData =
        SignInDataModel(email: emailInput, password: passwordInput);
    final result = await verifyLogInUseCase(signInData);
    result.fold(
      (l) =>
          InAppNotification.serverFailure(context: context, message: l.message),
      (r) {
        if (r) {
          context.push('/home');
        }
      },
    );
  }

  /* void onChangeEmail(String email){
    emailInput = email;
    notifyListeners();
  }*/
}
