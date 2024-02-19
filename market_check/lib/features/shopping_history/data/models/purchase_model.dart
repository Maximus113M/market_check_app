

class PurchaseModel{
  final int id;
  final String hora;
  final DateTime fecha;
  final double total;
  final int estado;
  final int establecimientoId;
  final int userId;
  final int sellerId;

  PurchaseModel({
    required this.id, 
    required this.hora, 
    required this.fecha, 
    required this.total, 
    required this.estado, 
    required this.establecimientoId, 
    required this.userId, 
    required this.sellerId,});

  factory PurchaseModel.fromJson(json)=>PurchaseModel(
    id: json["id"],
    hora:json["hora"], 
    fecha: json["fecha"], 
    total: json["total"], 
    estado: json["estado"], 
    establecimientoId: json["establecimiento_id"], 
    userId: json["user_id"], 
    sellerId: json["seller_id"]
    );
}