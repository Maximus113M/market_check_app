import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:market_check/config/errors/exceptions.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
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
      if (AuthService.user != null) {
        final response = await ServerService.serverPost(
          '${ServerUrls.productsUrl}scanner-product/',
          scannerData.dataToJson(),
        );
        if (response.statusCode == 200) {
          return ProductModel.fromJson(jsonDecode(response.body)["product"]);
        }
      }

      return null;
    } on HttpException catch (e) {
      debugPrint('Scanner httpException: $e');
      throw RemoteException(
          message:
              "Ocurrio un error al conectarse al servidor, intente de nuevo mas tarde",
          type: ExceptionType.scanner);
    } catch (e) {
      debugPrint('Scanner Exception: $e');
      throw RemoteException(
          message: 'Ha ocurrido un error al scannear el producto.',
          type: ExceptionType.scanner);
    }
  }
}
