import 'package:flutter/material.dart';

import 'package:market_check/config/services/scanner/scanner_service.dart';
import 'package:market_check/config/utils/constans/in_app_notification.dart';
import 'package:market_check/features/purchases/presentation/providers/shopping_cart_provider.dart';
import 'package:market_check/features/scanner/data/models/scanner_data_model.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/scanner/domain/use_cases/get_store_product_by_scanner_use_case.dart';

import 'package:provider/provider.dart';

class ScannerProvider with ChangeNotifier {
  final GetStoreProductByScannerUseCase getStoreProductByScannerUseCase;
  String scanBarCode = '';

  ScannerProvider({required this.getStoreProductByScannerUseCase});

  void getProductByScanner(BuildContext context) async {
    int storeId = 0;
    scanBarCode = await ScannerService.scanBarcodeNormal().then((code) {
      storeId = Provider.of<StoresProvider>(context, listen: false).currentStore!.id;
      return code;
    });

    print(scanBarCode);
    if (int.parse(scanBarCode) < 0) return;

    final ScannerDataModel scannerData =
        ScannerDataModel(storeId: storeId, productCode: int.parse(scanBarCode));
    final result = await getStoreProductByScannerUseCase(scannerData);

    result.fold(
        (l) => InAppNotification.serverFailure(
              context: context,
              message: l.message,
            ), (product) {
      print(product);
      if (product != null) {
        context.read<ShoppingCartProvider>().addNewProductToCart(product);
      }
    });
  }
}
