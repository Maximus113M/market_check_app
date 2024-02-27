class StoreModel {
  final int id;
  final int nit;
  final int state;
  final String name;
  final String email;
  final String? description;
  final String? color;
  final String? poster;
  final String? logo;
  final String locations; //TODO: LIST<LOCATIONS>

  StoreModel({
    required this.id,
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
        name: json["NombreEstablecimiento"],
        email: json["CorreoEstablecimiento"],
        description: json["Lema"],
        color: json["ColorInterfaz"],
        poster: json["Imagen"],
        logo: json["Logo"],
        locations: json["DireccionEstablecimiento"],
      );
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
