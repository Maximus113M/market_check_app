class ServerUrls {
//Base Urls
  static const String baseUrl = "http://127.0.0.1:8000/api/";
  static const String baseUrlMovil = "http://10.0.2.2:8000/api/";
  static const String baseUrlMovilSena = "http://10.201.194.65:8000/api/";
  static const String baseUrlMarly = "http://192.168.1.41:8000/api/";
  static const String baseUrlIpv4Camilo = "http://192.168.1.10:8000/api/";

  static const String baseHttp = "127.0.0.1:8000";

  static const String baseHttpMovil = "10.0.2.2:8000";

  static const String baseHttpMarly = "192.168.1.41:8000";

  static const String baseHttpMovilSena = "10.201.194.65:8000";

  static const String baseHttpIpv4Camilo = '192.168.1.10:8000';

//"http://10.201.194.65:8000/api/";

//Constans Urls
  static const String signInUrl = "auth/login/";
  static const String signUpUrl = "auth/mobile-app/";
  static const String logOutUrl = "auth/logout/";

  static const String userUrl = "user/";
  static const String imagesUrl = "images/";
  static const String offersUrl = "ofertas/mobile-app/";
  static const String productsUrl = "productos/";
  static const String productsCategoriesUrl = "productos/productsCategories/";
  static const String categoriesUrl = "categoria/";
  static const String storesUrl = "establecimiento/";
  static const String categoriesUrlByStore =
      "establecimiento/showCategoriesByStore/";

  static const String purchaseUrl = "compras/";
  static const String createPurchaseUrl = "new-purchase/";

  static const String shoppingHistoryUrl = "mobile-app/";

//Dynamic Urls
  static const String currentUrl = baseUrlMovilSena;
  //static const String currentUrl = baseUrlIpv4Camilo;

  static const String currentHttp = baseHttpMovilSena;
  //static const String currentHttp = baseHttpIpv4Camilo;

  static String currentUrlSignIn = baseUrlMovil.replaceFirst('api/', '');

  static String currentImagesUrl =
      "${currentUrl.replaceFirst('api/', '')}storage/images/";

  static String currentImagesUrlCategories =
      "${currentUrl.replaceFirst('api/', '')}images/categorias/";
}
