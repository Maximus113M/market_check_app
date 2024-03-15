class FavoriteProductModel {
  final int productId;
  final String productName;
  final int storeId;
  final int total;
  final String storeName;

  FavoriteProductModel({
    required this.productId,
    required this.productName,
    required this.storeId,
    required this.total,
    required this.storeName,
  });

  factory FavoriteProductModel.fromJson(json) => FavoriteProductModel(
        productId: json['producto_id'],
        productName: json['nombreProducto'],
        storeId: json['id_establecimiento'],
        total: json['total_comprado'],
        storeName: json['nombre_establecimiento'],
      );
}
