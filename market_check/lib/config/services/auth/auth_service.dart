import  'package:market_check/config/shared/models/user.dart';

class AuthService{
  static User? user;
  static String? token;
  static String? typeToken;

  static Map<String, dynamic> headers= {
      'Content-Type':'application/json',
      'Authorization':'Bearer ${AuthService.token}'
    };
}