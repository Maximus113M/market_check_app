class User {
  final int? id;
  final String name;
  final String document;
  final String email;
  final int rolId;
  final int? profileImage;

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
    required this.profileImage
  });

  factory User.fromJson(json, {bool isEncripted = false}) => User(
        id: isEncripted ? int.parse(json["id"]) : json["id"],
        name: json["name"],
        document: json["documento"] != null
            ? json["documento"].toString()
            : json["documento"] == 'null'
                ? ''
                : '',
        email: json["email"],
        rolId: int.tryParse('${json["rol_id"]}') ?? 4,
        profileImage: int.tryParse('${json["image_profile"]}') 



        
      );

  Map<String, dynamic> userToJson() => {
        if (id != null) "id": id,
        if (document.isNotEmpty) "documento": document,
        "name": name,
        "email": email,
        "rol_id": rolId,
        "profile_image": profileImage
      };
}
