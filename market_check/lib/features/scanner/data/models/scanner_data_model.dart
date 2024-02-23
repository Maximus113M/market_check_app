class ScannerDataModel {
  final int storeId;
  final int productCode;

  ScannerDataModel({required this.storeId, required this.productCode});

  Map<String, dynamic> dataToJson() {
    return {'store_id': storeId, 'product_code': productCode};
  }
}
