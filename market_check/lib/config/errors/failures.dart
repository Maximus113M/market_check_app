import 'package:market_check/config/errors/exceptions.dart';

abstract class Failure {}

class RemoteFailure extends Failure {
  final String message;
  final ExceptionType type;

  RemoteFailure({required this.message, required this.type});
}

class LocalFailure extends Failure {
  final String message;
  final Exception type;

  LocalFailure({required this.message, required this.type});
}
