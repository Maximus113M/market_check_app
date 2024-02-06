import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/utils/constans/in_app_notification.dart';
import 'package:market_check/features/login/data/models/sign_in_data_model.dart';
import 'package:market_check/features/login/domain/use_cases/verify_log_in_use_case.dart';

import 'package:go_router/go_router.dart';

class SignInProvider with ChangeNotifier {
  //TODO ARREGLAR AL USAR INYECCION DE DEPENDENCIAS
  final VerifyLogInUseCase verifyLogInUseCase;
  String emailInput = '';
  String passwordInput = '';

  SignInProvider({required this.verifyLogInUseCase});

  void validateUser(BuildContext context) async {
    if (emailInput.trim().isEmpty ||
        !AppFuntions.emailRegExp.hasMatch(emailInput)) {
      InAppNotification.showAppNotification(
          context: context,
          title: 'Email Invalido!',
          message: 'El formato de correo ingresado no es valido',
          type: NotificationType.error);
      return;
    }
    if (passwordInput.contains(" ") ||
        passwordInput.isEmpty ||
        passwordInput.length < 6) {
      InAppNotification.showAppNotification(
          context: context,
          title: 'Contraseña Invalida!',
          message:
              'La contraseña no debe contener espacios y ser mayor de 5 digitos',
          type: NotificationType.error);
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
