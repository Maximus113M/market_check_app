import 'package:flutter/material.dart';
import 'package:market_check/config/services/auth/auth_service.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/config/utils/constans/in_app_notification.dart';
import 'package:market_check/config/shared/models/create_user_data_model.dart';
import 'package:market_check/features/pending_purchases/presentation/providers/pending_provider.dart';
import 'package:market_check/features/sign_in/data/models/sign_in_data_model.dart';
import 'package:market_check/features/sign_in/domain/use_cases/sign_up_use_case.dart';
import 'package:market_check/features/sign_in/domain/use_cases/sign_out_use_case.dart';
import 'package:market_check/features/sign_in/domain/use_cases/verify_log_in_use_case.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/sign_in/domain/use_cases/verify_current_session_use_case.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignInProvider with ChangeNotifier {
  final VerifyCurrentSessionUseCase verifyCurrentSessionUseCase;
  final VerifyLogInUseCase verifyLogInUseCase;
  final SignUpUseCase signUpUseCase;
  final SignOutUseCase signOutUseCase;

  String emailInput = '';
  String passwordInput = '';
  bool obscureText = true;
  String names = "";
  String document = "";
  String confirmPassword = "";

  SignInProvider({
    required this.verifyCurrentSessionUseCase,
    required this.verifyLogInUseCase,
    required this.signUpUseCase,
    required this.signOutUseCase,
  });

  void toggleObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }

  void verifyCurrentSession(BuildContext context) async {
    final result = await verifyCurrentSessionUseCase(NoParams());
    String route = '/login-form';
    result.fold((l) {
      debugPrint(l.message);
      Future.delayed(const Duration(seconds: 1)).then(
        (value) => context.pushReplacement(route),
      );
    }, (r) async {
      if (AuthService.user != null) {
        context.read<PendingPurchaseProvider>().setFirstPendingPurchases(r);
        context.read<StoresProvider>().loadStores(context, notify: true);
        route = '/main';
      }

      Future.delayed(const Duration(seconds: 1)).then(
        (value) => context.pushReplacement(route),
      );
    });
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

    final SignInDataModel signInData =
        SignInDataModel(email: emailInput, password: passwordInput);
    final result = await verifyLogInUseCase(signInData);
    result.fold(
      (l) =>
          InAppNotification.serverFailure(context: context, message: l.message),
      (r) {
        if (AuthService.user != null) {
          context.read<PendingPurchaseProvider>().setFirstPendingPurchases(r);
          context.read<StoresProvider>().loadStores(context, notify: true);
          context.pushReplacement('/main');
        }
      },
    );
  }

  void validateSingUp(BuildContext context) async {
    if (!validateInputName() ||
        !validateInputDocument() ||
        !validateInputEmail() ||
        !validateInputPassword() ||
        !validateInputConfirmPassword()) {
      InAppNotification.showAppNotification(
          context: context,
          title: 'Error en el registro',
          message: 'Revise nuevamente los datos ingresados',
          type: NotificationType.error);
      return;
    }

    final SignUpDataModel singUpData = SignUpDataModel(
        name: names,
        document: int.tryParse(document),
        email: emailInput,
        password: passwordInput);

    final result = await signUpUseCase(singUpData);
    result.fold(
      (l) =>
          InAppNotification.serverFailure(context: context, message: l.message),
      (r) async {
        InAppNotification.showAppNotification(
            context: context,
            title: 'Registro',
            message: 'Registro Exitoso',
            type: NotificationType.success);
        await Future.delayed(const Duration(seconds: 2)).then(
          (value) => context.pushReplacement("/login-form"),
        );
      },
    );
  }

  bool validateInputName() {
    if (names.isEmpty) return false;
    return true;
  }

  bool validateInputDocument() {
    if (document.isEmpty) return false;
    return true;
  }

  bool validateInputEmail() {
    if (emailInput.trim().isEmpty ||
        !AppFuntions.emailRegExp.hasMatch(emailInput)) return false;
    return true;
  }

  bool validateInputPassword() {
    if (passwordInput.contains(" ") ||
        passwordInput.isEmpty ||
        passwordInput.length < 6) return false;
    return true;
  }

  bool validateInputConfirmPassword() {
    if (confirmPassword.contains(" ") ||
        confirmPassword.isEmpty ||
        confirmPassword.length < 6 ||
        passwordInput != confirmPassword) {
      return false;
    }
    return true;
  }

  void signOut(BuildContext context) async {
    final result = await signOutUseCase(NoParams());
    result.fold((l) {
      InAppNotification.serverFailure(context: context, message: l.message);
    }, (r) async {
      if (r) {
        context.pushReplacement('/login-form');
      } else {
        InAppNotification.showAppNotification(
            context: context,
            title: 'Error!',
            message: 'Credenciales Invalidas. Redireccionando.',
            type: NotificationType.warning);
        await Future.delayed(const Duration(seconds: 2)).then(
          (value) => context.pushReplacement('/login-form'),
        );
      }
    });
  }
}
