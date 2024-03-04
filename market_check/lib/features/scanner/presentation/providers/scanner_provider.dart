import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/services/auth/auth_service.dart';

import 'package:market_check/config/services/scanner/scanner_service.dart';
import 'package:market_check/config/utils/constans/in_app_notification.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/shopping/presentation/providers/shopping_provider.dart';
import 'package:market_check/features/scanner/presentation/widgets/scanned_product_dialog.dart';
import 'package:market_check/features/shopping/data/models/shopping_cart_item_model.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/scanner/domain/use_cases/get_store_product_by_scanner_use_case.dart';

import 'package:provider/provider.dart';

class ScannerProvider with ChangeNotifier {
  final GetStoreProductByScannerUseCase getStoreProductByScannerUseCase;
  String scanBarCode = '';
  ProductModel? currentProduct;

  ScannerProvider({required this.getStoreProductByScannerUseCase});

  void getProductByScanner(BuildContext context) async {
    int storeId = context.read<StoresProvider>().currentStore!.id;
    scanBarCode = await ScannerService.scanBarcodeNormal();

    //TODO DESARROLLO EN MOVIL PARA SIMULAR UN PRODUCTO
    if (int.parse(scanBarCode) == -1) {
      final ProductModel product = ProductModel(
        id: 1,
        code: 789789,
        state: 1,
        currentPrice: 6000,
        originalPrice: 6000,
        name: 'Nachos ExtraQueso',
        description: '500 g',
        stock: 200,
        storeId: 1,
        categoryId: 1,
        subcategoryId: 1,
      );
      currentProduct = product;
      notifyListeners();
    }

    //
    print(scanBarCode);
    /* if (int.parse(scanBarCode) < 0) return;

    final ScannerDataModel scannerData =
        ScannerDataModel(storeId: storeId, productCode: int.parse(scanBarCode));
    final result = await getStoreProductByScannerUseCase(scannerData);

    result.fold(
        (l) => InAppNotification.serverFailure(
              context: context,
              message: l.message,
            ), (product) {
      print(product);
      if (product == null) {
        InAppNotification.showAppNotification(
            context: context,
            title: 'Error al escanear el Producto',
            message: 'No pudimos obtener el producto escaneado :(',
            type: NotificationType.warning);
        return;
      }
      currentProduct = product;
      notifyListeners();
    });*/
    Future.delayed(const Duration(seconds: 1))
        .then((value) => showScannedProduct(context));
  }

  void showScannedProduct(BuildContext context) {
    int productCount = 1;
    int totalPrice = currentProduct!.currentPrice;
    void getTotalPrice() {
      totalPrice = currentProduct!.currentPrice * productCount;
    }

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => ScannedProductDialog(
          product: currentProduct!,
          mainAction: () =>
              addProductToShoppingCart(context, productCount, totalPrice),
          secondaryAction: () => context.pop(),
          addAction: () {
            productCount++;
            getTotalPrice();
            setState(() {});
          },
          removeAction: () {
            if (productCount == 1) return;
            productCount--;
            getTotalPrice();
            setState(() {});
          },
          productCount: productCount,
          totalPrice: totalPrice,
        ),
      ),
    );
  }

  void addProductToShoppingCart(
      BuildContext context, int productCount, int totalPrice) {
    ShoppingCartItemModel shoppingCartItem = ShoppingCartItemModel(
        product: currentProduct!, quanty: productCount, totalPrice: totalPrice);

    bool result =
        context.read<ShoppingProvider>().addNewProductToCart(shoppingCartItem);
    clearCurrentProduct();
    context.pop();
    if (result) {
      InAppNotification.showAppNotification(
        context: context,
        title: 'Producto Agregado!',
        message: 'El producto ha sido agregado al carrito.',
        type: NotificationType.success,
      );
      return;
    }
    InAppNotification.showAppNotification(
      context: context,
      title: 'Hey, tienes una compra pendiente!',
      message:
          'Dirigete a una caja con el siguiente codigo ${AuthService.user!.purchasePin} o puedes elegir continuar o elimina la compra.',
      type: NotificationType.warning,
    );
  }

  void clearCurrentProduct() {
    currentProduct = null;
    notifyListeners();
  }
}
