class ProductModel {
  final int id;
  final int code;
  final int state;
  final int currentPrice;
  final int originalPrice;
  final String name;
  final String? description;
  final int stock;
  final int storeId;
  final int? categoryId;

  ProductModel({
    required this.id,
    required this.code,
    required this.state,
    required this.currentPrice,
    required this.originalPrice,
    required this.name,
    required this.description,
    required this.stock,
    required this.storeId,
    required this.categoryId,
  });

  factory ProductModel.fromJson(json) => ProductModel(
        id: json["id"],
        code: json["codigoProducto"],
        state: json["estado"],
        currentPrice: json["precioProducto"],
        originalPrice: json["precioOriginal"],
        name: json["nombreProducto"],
        description: json["descripcionProducto"],
        stock: json["numeroStock"],
        storeId: json["id_establecimiento"],
        categoryId: json["id_categoria"],
      );
}
