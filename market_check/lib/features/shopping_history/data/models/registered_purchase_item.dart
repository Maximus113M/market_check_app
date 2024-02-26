class RegisteredPurchaseItemModel {
  final int? id;
  final int productId;
  final int purchaseId;
  final String name;
  final int quanty;
  final double price;
  final double total;

  RegisteredPurchaseItemModel({
    required this.id,
    required this.productId,
    required this.purchaseId,
    required this.name,
    required this.quanty,
    required this.price,
    required this.total,
  });

  factory RegisteredPurchaseItemModel.fromJson(json) =>
      RegisteredPurchaseItemModel(
        id: json["id"],
        productId: json["producto_id"],
        purchaseId: json["compra_id"],
        name: json["nombre"],
        quanty: json["cantidad"],
        price: double.parse(json["precio"]),
        total: double.parse(json["total"]),
      );
}
