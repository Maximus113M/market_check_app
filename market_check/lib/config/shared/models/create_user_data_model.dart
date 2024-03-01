class SignUpDataModel {
  final String name;
  final int? document;
  final String email;
  final String? password;
  final int rolId;
  final int? profileImage;

  SignUpDataModel(
      {this.rolId = 4,
      required this.name,
      required this.document,
      required this.email,
      required this.password,
      this.profileImage, 
      });

  factory SignUpDataModel.fromJson(json) => SignUpDataModel(
        name: json['name'],
        document: json['documento'],
        email: json['email'],
        password: json['password'],
        rolId: json['rol_id'],
        profileImage: json['image_profile']
      );

  Map<String, dynamic> userToJson() => {
        "name": name,
        "documento": document,
        "email": email,
        "rol_id": rolId,
        if (password != null) "password": password,
        "image_profile": profileImage ?? 0
      };
}
