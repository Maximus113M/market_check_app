import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/services/remote_service/remote_urls.dart';
import 'package:market_check/features/products/data/models/product_model.dart';

import 'package:dio/dio.dart';
import 'package:market_check/features/products/data/models/scanner_data_model.dart';

abstract class ProductsDataSource {
  Future<List<ProductModel>> getStoreProducts(int storeId);
  Future<ProductModel?> getStoreProductByScanner(ScannerDataModel scannerData);
}

class ProductsDataSourceImpl extends ProductsDataSource {
  final Dio dioGetStoreProducts = Dio(
    BaseOptions(
        baseUrl: "${RemoteUrls.currentUrl}${RemoteUrls.productsUrl}",
        headers: AuthService.headers),
  );

  @override
  Future<List<ProductModel>> getStoreProducts(int storeId) async {
    try {
      List<ProductModel> products = [];
      if (AuthService.user != null) {
        final Response response = await dioGetStoreProducts.get(
          'store-products/$storeId',
        );
        if (response.statusCode == 200) {
          products = (response.data["products"] as List)
              .map((productJson) => ProductModel.fromJson(productJson))
              .toList();
          return products.where((product) => product.state != 0).toList();
        }
      }
      return [];
    } catch (e) {
      print(e);
      throw RemoteException(
          message: 'Ha ocurrido un error al consultar los productos.',
          type: ExceptionType.purchasesException);
    }
  }

  @override
  Future<ProductModel?> getStoreProductByScanner(
      ScannerDataModel scannerData) async {
    try {
      if (AuthService.user != null) {
        final Response response = await dioGetStoreProducts
            .get('store-products/', data: scannerData.dataToJson());
        if (response.statusCode == 200) {
          return ProductModel.fromJson(response.data["product"]);
        }
      }

      return null;
    } catch (e) {
      print(e);
      throw RemoteException(
          message: 'Ha ocurrido un error al scannear el producto.',
          type: ExceptionType.purchasesException);
    }
  }
}
