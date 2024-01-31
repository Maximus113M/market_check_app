class OfferModel {
  final int? id;
  final int state;
  final DateTime dateStart;
  final DateTime dateEnd;
  final String name;
  final String description;
  final int image;
  final int stock;
  final int storeId;

  OfferModel({
    this.id,
    required this.state,
    required this.dateStart,
    required this.dateEnd,
    required this.name,
    required this.description,
    required this.image,
    required this.stock,
    required this.storeId,
  });

  factory OfferModel.fromJson(json) => OfferModel(
        id: json["id"],
        state: json["estado"],
        dateStart: json["fecha_inicio"],
        dateEnd: json["fecha_fin"],
        name: json["nombre"],
        description: json["descripcion"],
        image: json["imagen"],
        stock: json["numero_stock"],
        storeId: json["establecimiento_id"],
      );

  Map<String, dynamic> storeModelToJson() => {
        if (id != null) "id": id,
        "estado": state,
        "fecha_inicio": dateStart,
        "fecha_fin": dateEnd,
        "nombre": name,
        "descripcion": description,
        "imagen": image,
        "numero_stock": stock,
        "establecimiento_id": storeId,
      };
}
