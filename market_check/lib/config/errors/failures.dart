abstract class Failure {}

class SharedFailure extends Failure {
  final String message;

  SharedFailure({required this.message});
}

class SplashFailure extends Failure {
  final String message;

  SplashFailure({required this.message});
}

class LoginFailure extends Failure {
  final String message;

  LoginFailure({required this.message});
}

class OffersFailure extends Failure {
  final String message;

  OffersFailure({required this.message});
}

class HomeFailure extends Failure {
  final String message;

  HomeFailure({required this.message});
}

class ProfileFailure implements Failure {
  final String message;

  ProfileFailure({required this.message});
}

class SettingsFailure implements Failure {
  final String message;

  SettingsFailure({required this.message});
}

class ShoppingCartFailure implements Failure {
  final String message;

  ShoppingCartFailure({required this.message});
}

class ShoppingHistoryFailure implements Failure {
  final String message;

  ShoppingHistoryFailure({required this.message});
}

class ShoppingListFailure implements Failure {
  final String message;

  ShoppingListFailure({required this.message});
}

class StoreItemsFailure implements Failure {
  final String message;

  StoreItemsFailure({required this.message});
}

class StoresFailure implements Failure {
  final String message;

  StoresFailure({required this.message});
}
