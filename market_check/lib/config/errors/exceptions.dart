class RemoteException implements Exception {
  final String message;
  final ExceptionType type;

  RemoteException({required this.message, required this.type});
}

class LocalException implements Exception {
  final String message;
  final ExceptionType type;

  LocalException({required this.message, required this.type});
}

enum ExceptionType {
  splashException,
  logInException,
  signUpException,
  homeException,
  offersException,
  storesException,
}
