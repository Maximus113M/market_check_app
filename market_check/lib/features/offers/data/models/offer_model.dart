class OfferModel {
  final int? id;
  final int state;
  final String dateStart; //Datetime
  final String dateEnd; //Datetime
  final String name;
  final String description;
  final String imagePath;
  final int stock;
  final int storeId;

  OfferModel({
    this.id,
    required this.state,
    required this.dateStart,
    required this.dateEnd,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.stock,
    required this.storeId,
  });

  factory OfferModel.fromJson(json, String imageUrl) => OfferModel(
        id: json["id"],
        state: json["estado"],
        dateStart: json["fecha_inicio"],
        dateEnd: json["fecha_fin"],
        name: json["nombre"],
        description: json["descripcion"],
        imagePath: json["imagen"],
        stock: json["numero_stock"],
        storeId: json["establecimiento_id"],
      );
  //TODO: ELIMINAR?
  Map<String, dynamic> storeModelToJson() => {
        if (id != null) "id": id,
        "estado": state,
        "fecha_inicio": dateStart,
        "fecha_fin": dateEnd,
        "nombre": name,
        "descripcion": description,
        "imagen": imagePath,
        "numero_stock": stock,
        "establecimiento_id": storeId,
      };
}
