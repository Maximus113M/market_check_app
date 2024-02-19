class User {
  final int? id;
  final String name;
  final String document;
  final String email;
  final int rolId;

  bool isPurchaseOpen;
  int? purchasePin;

  User({
    this.id,
    required this.name,
    required this.document,
    required this.email,
    required this.rolId,
    this.isPurchaseOpen = false,
    this.purchasePin,
  });

  factory User.fromJson(json, {bool isEncripted = false}) => User(
        id: isEncripted ? int.parse(json["id"]) : json["id"],
        name: json["name"],
        document: json["documento"] != null ? json["documento"].toString() : '',
        email: json["email"],
        rolId: json["rol_id"] ?? 4,
      );

  Map<String, dynamic> userToJson() => {
        if (id != null) "id": id,
        if (document.isNotEmpty) "documento": document,
        "name": name,
        "email": email,
        "rol_id": rolId
      };
}
