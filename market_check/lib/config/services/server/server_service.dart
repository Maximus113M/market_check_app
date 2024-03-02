import 'dart:convert';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/server/server_urls.dart';

import 'package:http/http.dart' as http;

class ServerService {
  ServerService._();
  static const String _baseUrl = ServerUrls.currentHttp;

  static Future<http.Response> serverGet(String path) async {
    final Uri uri = Uri.http(_baseUrl, '/api/$path');

    try {
      final response = await http.get(
        uri,
        headers: AuthService.headers,
      );

      return response;
    } on http.ClientException catch (e) {
      throw HttpException(
        message: e.message,
      );
    }
  }

  static Future<http.Response> serverPost(
      String path, Map<String, dynamic> json) async {
    final Uri uri = Uri.http(_baseUrl, '/api/$path');

    try {
      final response = await http.post(
        uri,
        body: jsonEncode(json),
        headers: AuthService.headers,
      );

      return response;
    } on http.ClientException catch (e) {
      throw HttpException(
        message: e.message,
      );
    }
  }

  static Future<http.Response> serverPut(
      String path, Map<String, dynamic> json) async {
    final Uri uri = Uri.http(_baseUrl, '/api/$path');

    try {
      final response = await http.put(
        uri,
        body: jsonEncode(json),
        headers: AuthService.headers,
      );

      return response;
    } on http.ClientException catch (e) {
      throw HttpException(
        message: e.message,
      );
    }
  }

  static Future<http.Response> serverDelete(String path) async {
    final Uri uri = Uri.http(_baseUrl, '/api/$path');

    try {
      final response = await http.delete(
        uri,
        headers: AuthService.headers,
      );

      return response;
    } on http.ClientException catch (e) {
      throw HttpException(
        message: e.message,
      );
    }
  }
}
