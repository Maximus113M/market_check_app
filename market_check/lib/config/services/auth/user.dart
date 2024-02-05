class User {
  final int id;
  final String name;
  final String? document;
  final String email;
  final int rolId;
  final String token;
  final String typeToken;

  User({
    required this.id,
    required this.name,
    required this.document,
    required this.email,
    required this.rolId,
    required this.token,
    required this.typeToken,
  });

  factory User.fromJson(json) => User(
      id: json["user"]["id"],
      name: json["user"]["name"],
      document: json["user"]["documento"],
      email: json["user"]["email"],
      rolId: json["user"]["rol_id"],
      token: json["access_token"],
      typeToken: json["token_type"]);
}
