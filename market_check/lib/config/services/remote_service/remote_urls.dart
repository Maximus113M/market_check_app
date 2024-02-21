class RemoteUrls {
//Base Urls
  static const String baseUrl = "http://127.0.0.1:8000/api/";
  static const String baseUrlMovil = "http://10.0.2.2:8000/api/";
  static const String baseUrlMovilSena = "http://10.201.194.65:8000/api/";
  static const String baseUrlMarly = "http://192.168.1.41:8000/api/";

  static const String baseHttpMovilSena = "10.201.194.65:8000";


//"http://10.201.194.65:8000/api/";

//Constans Urls
  static const String signInUrl = "auth/login/";
  static const String signUpUrl = "auth/mobile-app/";
  static const String logOutUrl = "auth/logout/";

  static const String userUrl = "user/";
  static const String imagesUrl = "images/";
  static const String offersUrl = "ofertas/";
  static const String productsUrl = "productos/";
  static const String productsCategoriesUrl = "productos/productsCategories/";
  static const String categoriesUrl = "categoria/";
  static const String storesUrl = "establecimiento/";
  static const String categoriesUrlByStore =
      "establecimiento/showCategoriesByStore/";

  static const String purchaseUrl = "compras/";

  static const String shoppingHistoryUrl = "mobile-app/";

//Dynamic Urls
  static const String currentUrl = baseUrlMovilSena;

  static const String currentHttp = baseHttpMovilSena;

  static String currentUrlSignIn = baseUrlMovil.replaceFirst('api/', '');

  static String currentImagesUrl =
      "${currentUrl.replaceFirst('api/', '')}storage/images/";

  static String currentImagesUrlCategories =
      "${currentUrl.replaceFirst('api/', '')}images/categorias/";
}
