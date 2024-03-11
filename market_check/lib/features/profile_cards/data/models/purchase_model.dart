class PurchaseModel {
  final int id;
  final String hour;
  final DateTime date;
  final int total;
  final int state;
  final int pin;
  final int establecimientoId;
  final int? userId;
  final int? sellerId;

  PurchaseModel({
    required this.id,
    required this.hour,
    required this.date,
    required this.total,
    required this.state,
    required this.pin,
    required this.establecimientoId,
    required this.userId,
    required this.sellerId,
  });

  factory PurchaseModel.fromJson(json) => PurchaseModel(
        id: json["id"],
        hour: json["hora"],
        date: DateTime.parse(json["fecha"] as String),
        total: json["total"],
        state: json["estado"],
        pin: json["pin"],
        establecimientoId: json["establecimiento_id"],
        userId: json["user_id"],
        sellerId: json["seller_id"],
      );
}
