import 'package:flutter_riverpod/flutter_riverpod.dart';

final validUser = Provider<String>((ref) {
  return 'Camilo@gmail.com';
});

final validPassword = Provider<String>((ref) {
  return '123456';
});

final inputUser = StateProvider<String>((ref) => '');
final inputPassword = StateProvider<String>((ref) => '');
