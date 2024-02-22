import 'package:market_check/config/shared/models/user.dart';

class AuthService {
  AuthService._();

  static User? user;
  static String? token;
  static String? typeToken;

  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': '$typeToken $token'
  };
}
