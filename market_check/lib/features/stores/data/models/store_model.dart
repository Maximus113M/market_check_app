class StoreModel {
  final int? id;
  final int nit;
  final int state;
  final String name;
  final String email;
  final String? description;
  final int? color;
  final String poster;
  final String logo;
  final List<StoreLocation> locations;

  StoreModel({
    this.id,
    required this.nit,
    required this.state,
    required this.name,
    required this.email,
    required this.description,
    this.color,
    required this.poster,
    required this.logo,
    required this.locations,
  });

  factory StoreModel.fromJson(json) => StoreModel(
        id: json["id"],
        nit: json["Nit"],
        state: json["Estado"],
        name: json["NombreEstblecimiento"],
        email: json["CorreoEstablecimiento"],
        description: json["Lema"],
        color: json["ColorInterfaz"],
        poster: json["Imagen"],
        logo: json["Logo"],
        locations: json["DireccionEstablecimiento"],
      );

      Map<String, dynamic>storeModelToJson()=>{
        if(id != null) "id": id,
        "Nit": nit,
        "Estado": state,
        "NombreEstblecimiento": name,
        "CorreoEstablecimiento": email,
        "Lema": description,
        "ColorInterfaz": color,
        "Imagen": poster,
        "Logo": logo,
        "DireccionEstablecimiento": locations.first
      };
}

class StoreLocation {
  final String name;
  final String location;
  final String? phoneNumber;

  StoreLocation({
    required this.name,
    required this.location,
    this.phoneNumber = 'No-number',
  });
}
