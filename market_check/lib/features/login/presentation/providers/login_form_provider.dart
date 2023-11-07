import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginProvider with ChangeNotifier {
  String userInput = '';
  String passwordInput = '';

  void validateUser({required BuildContext context, required String route}) {
    if (userInput == 'Camilo@' && passwordInput == '123456') {
      context.push(route);
    }
    null;
  }
}
