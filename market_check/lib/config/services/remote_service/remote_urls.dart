class RemoteUrls {
  static const String baseUrl = "http://127.0.0.1:8000/api/";
  static const String baseUrlMovil = "http://10.0.2.2:8000/api/";
  static const String baseUrlMovilSena =  "http://10.201.194.65:8000/api/";
//"http://192.168.1.41:8000/api/";

  static const String authUrl = "auth/login/";
  static const String signUpUrl = "auth/mobile-app/";
  static const String storesUrl = "establecimiento/";
  static const String imagesUrl = "images/";
  static const String offersUrl = "ofertas/";
  static const String purchaseUrl = "new-purchase/";
  static const String shoppingHistoryUrl = "mobile-app/";

  static const String currentUrl = baseUrlMovilSena;

  static String currentImagesUrl =
      "${currentUrl.replaceFirst('api/', '')}storage/images/";
}
