class SignUpDataModel{
  final String name;
  final int? document;
  final String email;
  final String password;
  final int rolId;

  SignUpDataModel({
    this.rolId = 4,
    required this.name, 
    required this.document, 
    required this.email, 
    required this.password
    });

    factory SignUpDataModel.fromJson(json) =>SignUpDataModel(
      name: json['name'], 
      document: json['documento'], 
      email: json['email'], 
      password: json['password'],
      rolId: json['rol_id'],
      );
      

    Map<String, dynamic> userToJson() => {
      "name": name,
      "documento": document,
      "email": email,
      "password": password,
    };



}