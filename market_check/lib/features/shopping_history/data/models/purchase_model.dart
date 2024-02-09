

class PurchaseModel{
  final int id;
  final String hora;
  final DateTime fecha;
  final double total;
  final int estado;
  final int establecimiento_id;
  final int user_id;
  final int seller_id;

  PurchaseModel({
    required this.id, 
    required this.hora, 
    required this.fecha, 
    required this.total, 
    required this.estado, 
    required this.establecimiento_id, 
    required this.user_id, 
    required this.seller_id,});

  factory PurchaseModel.fromJson(json)=>PurchaseModel(
    id: json["id"],
    hora:json["hora"], 
    fecha: json["fecha"], 
    total: json["total"], 
    estado: json["estado"], 
    establecimiento_id: json["establecimiento_id"], 
    user_id: json["user_id"], 
    seller_id: json["seller_id"]
    );
}