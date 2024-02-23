import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/features/purchases/data/models/purchase_item_model.dart';
import 'package:market_check/features/purchases/presentation/providers/shopping_cart_provider.dart';
import 'package:provider/provider.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  ScannerScreenState createState() => ScannerScreenState();
}

class ScannerScreenState extends State<ScannerScreen> {
  String _scanBarcode = '';
  late ShoppingCartProvider shoppingCartProvider;
  bool isScreenLoaded = false;

  @override
  void didChangeDependencies() async {
    if (isScreenLoaded) return;
    isScreenLoaded = true;
    shoppingCartProvider = Provider.of<ShoppingCartProvider>(context);

    if (mounted) setState(() {});
    super.didChangeDependencies();
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancelar', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancelar', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancelar', true, ScanMode.BARCODE);
      print(barcodeScanRes);
      if (int.parse(barcodeScanRes) > 0) {
        /*shoppingCartProvider.shoppingList.add(
          PurchaseItemModel(
              name: 'Desodorante Guillette',
              image: 'assets/Images/items/gillette.jpg',
              price: 7000),
        );*/
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(),
        body: Builder(builder: (BuildContext context) {
          return Container(
              alignment: Alignment.center,
              child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () => {
                              scanBarcodeNormal(),
                            },
                        child: const Text('Escanea el Codigo')),
                    ElevatedButton(
                        onPressed: () => scanQR(),
                        child: const Text('Escaneo QR')),
                    // ElevatedButton(
                    //     onPressed: () => startBarcodeScanStream(),
                    //     child: const Text('Start barcode scan stream')),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Producto : $_scanBarcode\n',
                        style: const TextStyle(fontSize: 20))
                  ]));
        }));
  }
}
