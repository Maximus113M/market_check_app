import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/config/services/server/server_service.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/scanner/data/models/scanner_data_model.dart';

abstract class ScannerDataSource {
  Future<ProductModel?> getStoreProductByScanner(ScannerDataModel scannerData);
}

class ScannerDataSourceImpl extends ScannerDataSource {
  ScannerDataSourceImpl();
  @override
  Future<ProductModel?> getStoreProductByScanner(
      ScannerDataModel scannerData) async {
    try {
      final response = await ServerService.serverPost(
        '${ServerUrls.productsUrl}${ServerUrls.productsByScannerUrl}',
        scannerData.dataToJson(),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw HttpException(
            message: '${response.statusCode}, ${response.reasonPhrase}');
      }
      String? fixedResponse;
      if (!response.body.endsWith('}')) {
        fixedResponse = '${response.body}}';
      }

      ProductModel? product;
      if (jsonDecode(fixedResponse?? response.body)["product"] == null) {
        return product;
      }

      return ProductModel.fromJson(jsonDecode(fixedResponse?? response.body)["product"]);
    } on HttpException catch (e) {
      debugPrint('ScannerDatasource, getProductsByScanner HttpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.scanner);
    } catch (e) {
      debugPrint('ScannerDatasource, getProductsByScanner Exception: $e');
      throw RemoteException(
          message: 'Ha ocurrido un error al scannear el producto.',
          type: ExceptionType.scanner);
    }
  }
}
