class User {
  final int? id;
  final String name;
  final String? document;
  final String email;
  final int rolId;

  bool isPurchaseOpen;
  int? purchasePin;

  User({
    required this.id,
    required this.name,
    required this.document,
    required this.email,
    required this.rolId,
    this.isPurchaseOpen= false,
    this.purchasePin,
  });

  factory User.fromJson(json) => User(
      id: json["user"]["id"],
      name: json["user"]["name"],
      document: json["user"]["documento"],
      email: json["user"]["email"],
      rolId: json["user"]["rol_id"],
      );

  Map<String, dynamic> userToJson() => {
        if (id != null) "id": id,
        if (document != null) "documento": document,
        "name": name,
        "email": email,
        "rol_id": rolId
      };
}
