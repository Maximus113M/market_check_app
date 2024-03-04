class ServerUrls {
  ServerUrls._();

//Base Urls
  static const String baseUrlMovilSena = "http://10.201.194.65:8000/api/";
  static const String baseUrlMarly = "http://192.168.1.41:8000/api/";
  static const String baseUrlIpv4Camilo = "http://192.168.1.10:8000/api/";

  static const String baseHttpMarly = "192.168.1.41:8000";

  static const String baseHttpMovilSena = "10.201.194.65:8000";

  static const String baseHttpIpv4Camilo = '192.168.1.10:8000';

  static const String hosting = 'marketcheck.api.adsocidm.com';
  static const String hostingUrl = 'https://marketcheck.api.adsocidm.com/api/';

//Constans Urls
  static const String signInUrl = "auth/login";
  static const String signUpUrl = "auth/mobile-app";
  static const String logOutUrl = "auth/logout/";
  static const String userUrl = "user/";
  static const String changePasswordUrl = "/change-password";

  static const String imagesUrl = "images/";
  static const String offersUrl = "ofertas/mobile-app/";

  static const String productsUrl = "productos/";
  static const String storeProductsUrl = "store-products/";
  static const String productsCategoriesUrl = "productos/productsCategories/";
  static const String productsByScannerUrl = "scanner-product";

  static const String categoriesUrl = "categoria/";
  static const String storesUrl = "establecimiento/";
  static const String listsUrl = "listas";

  static const String categoriesUrlByStore =
      "establecimiento/showCategoriesByStore/";

  static const String purchaseUrl = "compras/";
  static const String createPurchaseUrl = "new-purchase/";

  static const String openShoppingHistoryUrl = "open-purchases-app";
  static const String closeShoppingHistoryUrl = "close-purchases-app";

//Dynamic Urls
  //static const String currentUrl = hostingUrl;
  //static const String currentUrl = baseUrlMarly;
  static const String currentUrl = baseUrlIpv4Camilo;

  //static const String currentHttp = hosting;
  //static const String currentHttp = baseHttpMarly;
  static const String currentHttp = baseHttpIpv4Camilo;

  //static String currentUrlSignIn = baseUrlMovil.replaceFirst('api/', '');

  static String currentImagesUrl =
      "${currentUrl.replaceFirst('api/', '')}storage/images/";

  static String currentImagesUrlCategories =
      "${currentUrl.replaceFirst('api/', '')}images/categorias/";
}
