class ProductModel {
  final int id;
  final int code;
  final int state;
  final double currentPrice;
  final double originalPrice;
  final String name;
  final String? description;
  final int stock;
  final int storeId;
  final int? categoryId;
  final int? subcategoryId;

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
    required this.subcategoryId,
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
        subcategoryId: json["id_subcategoria"],
      );
}
