import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/utils/constans/in_app_notification.dart';
import 'package:market_check/features/login/data/models/sign_in_data_model.dart';
import 'package:market_check/features/login/domain/use_cases/sign_in_use_case.dart';
import 'package:market_check/features/login/domain/use_cases/verify_log_in_use_case.dart';

import 'package:go_router/go_router.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:provider/provider.dart';

class SignInProvider with ChangeNotifier {
  //TODO ARREGLAR AL USAR INYECCION DE DEPENDENCIAS
  final VerifyLogInUseCase verifyLogInUseCase;
  final SignUpUseCase signInUseCase;

  String emailInput = '';
  String passwordInput = '';
  bool obscureText = true;
  String names = "";
  int? document;
  String confirmPassword = "";

  SignInProvider({required this.signInUseCase, required this.verifyLogInUseCase});

   void toggleObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }

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
              'La contraseña no debe contener espacios y debe ser mayor de 5 digitos',
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
          context.read<StoresProvider>().loadStores(notify: true);
          context.push('/stores-m');
        }
      },
    );
    //context.pushReplacement('/stores-m');
  }

  /* void onChangeEmail(String email){
    emailInput = email;
    notifyListeners();
  }*/
}
