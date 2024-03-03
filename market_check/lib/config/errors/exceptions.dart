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

class HttpException implements Exception {
  final String message;

  HttpException({required this.message});
}

enum ExceptionType {
  splash,
  signUp,
  signIn,
  offers,
  stores,
  profile,
  products,
  purchases,
  categories,
  shoppingHistory,
  pendingPurchases,
  scanner,
  shoppingLists
}
