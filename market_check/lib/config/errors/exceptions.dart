class SharedException implements Exception {
  final String message;

  SharedException({required this.message});
}

class LoginException implements Exception {
  final String message;

  LoginException({required this.message});
}

class HomeException implements Exception {
  final String message;

  HomeException({required this.message});
}

class OffersException implements Exception {
  final String message;

  OffersException({required this.message});
}

class ProfileException implements Exception {
  final String message;

  ProfileException({required this.message});
}

class SettingsException implements Exception {
  final String message;

  SettingsException({required this.message});
}

class ShoppingCartException implements Exception {
  final String message;

  ShoppingCartException({required this.message});
}

class ShoppingHistoryException implements Exception {
  final String message;

  ShoppingHistoryException({required this.message});
}

class ShoppingListException implements Exception {
  final String message;

  ShoppingListException({required this.message});
}

class StoreItemsException implements Exception {
  final String message;

  StoreItemsException({required this.message});
}

class StoresException implements Exception {
  final String message;

  StoresException({required this.message});
}
