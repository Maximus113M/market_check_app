import 'dart:convert';

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

  String names = '';
  String document = '';
  String emailInput = '';
  String city = '';
  String state = 'Santander';
  bool obscureText = true;
  String passwordInput = '';
  String confirmPassword = '';
  bool isLoading = false;

  List<Map> colombiaData = [];
  List<String> states = [];
  List<dynamic> currentCities = [];

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
    if (isLoading) return;
    isLoading = true;

    if (emailInput.trim().isEmpty ||
        !AppFunctions.emailRegExp.hasMatch(emailInput)) {
      InAppNotification.showAppNotification(
          context: context,
          title: 'Email Invalido!',
          message: 'El formato de correo ingresado no es valido',
          type: NotificationType.error);
      isLoading = false;
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
      isLoading = false;
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
    isLoading = false;
  }

  void validateSingUp(BuildContext context) async {
    if (isLoading) return;
    isLoading = true;

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
      isLoading = false;
      notifyListeners();
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
            title: 'Registro Exitoso!',
            message: r,
            type: NotificationType.success);
        await Future.delayed(const Duration(seconds: 2)).then(
          (value) => context.pushReplacement("/login-form"),
        );
      },
    );
    isLoading = false;
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
        !AppFunctions.emailRegExp.hasMatch(emailInput)) return false;
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
    if (isLoading) return;
    isLoading = true;
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

    isLoading = false;
    notifyListeners();
  }

  getColombiaData(BuildContext context) async {
    try {
      colombiaData.clear();
      states.clear();
      String data = await DefaultAssetBundle.of(context)
          .loadString("assets/col_data/col_data.json");
      final jsonResult = json.decode(data) as List;
      for (var result in jsonResult) {
        Map newDepartmentMap = {
          'departamento': result['departamento'],
          'ciudades': result['ciudades'] as List,
        };
        colombiaData.add(newDepartmentMap);
        states.add(result['departamento']);
      }
      debugPrint('colombia country data completada');
    } catch (error) {
      debugPrint(
        'getColombiaData error : $error',
      );
    }
  }

  void getCities(String key) {
    final List<Map<dynamic, dynamic>> department = colombiaData
        .where((element) => element["departamento"] == key)
        .toList();
    currentCities = department.first["ciudades"];
    print(currentCities);
  }

  void updateStateValue(String newValue) {
    state = newValue;
    city = '';
    notifyListeners();
  }

  void updateCityValue(String newValue) {
    city = newValue;
    notifyListeners();
  }
}
