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
  signUpException,
  signInException,
  homeException,
  offersException,
  storesException,
  purchasesException,
  productsException,
  categoriesException,
  shoppingHistoryException,
}
