import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScannerService {
  ScannerService._();
  // Future<void> startBarcodeScanStream() async {
  //   FlutterBarcodeScanner.getBarcodeStreamReceiver(
  //           '#ff6666', 'Cancelar', true, ScanMode.BARCODE)!
  //       .listen((barcode) => print(barcode));
  // }

  static Future<String> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancelar', true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    return barcodeScanRes;
  }

  static Future<String> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancelar', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    return barcodeScanRes;
  }
}
