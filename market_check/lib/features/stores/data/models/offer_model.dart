class OfferModel {
  final int? id;
  final int state;
  final DateTime dateStart; //Datetime
  final DateTime dateEnd; //Datetime
  final String name;
  final String description;
  final String imagePath;
  final int storeId;

  OfferModel({
    this.id,
    required this.state,
    required this.dateStart,
    required this.dateEnd,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.storeId,
  });

  factory OfferModel.fromJson(json) => OfferModel(
        id: json["id"],
        state: json["estado"],
        dateStart: DateTime.parse(json["fecha_inicio"]),
        dateEnd: DateTime.parse(json["fecha_fin"]),
        name: json["nombre"],
        description: json["descripcion"],
        imagePath: json["imagen"],
        storeId: json["establecimiento_id"],
      );
  //TODO: ELIMINAR?
  Map<String, dynamic> offerModelToJson() => {
        if (id != null) "id": id,
        "estado": state,
        "fecha_inicio": dateStart,
        "fecha_fin": dateEnd,
        "nombre": name,
        "descripcion": description,
        "imagen": imagePath,
        "establecimiento_id": storeId,
      };
}
