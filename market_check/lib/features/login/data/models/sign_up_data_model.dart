class SignUpDataModel{
  final String name;
  final int? document;
  final String email;
  final String password;

  SignUpDataModel({
    required this.name, 
    required this.document, 
    required this.email, 
    required this.password
    });

    factory SignUpDataModel.fromJson(json) =>SignUpDataModel(
      name: json['names'], 
      document: json['document'], 
      email: json['emailInput'], 
      password: json['password']);

    Map<String, dynamic> userToJson() => {
      "name": name,
      "document": document,
      "email": email,
      "password": password
    };



}