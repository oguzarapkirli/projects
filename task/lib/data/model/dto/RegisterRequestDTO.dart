class RegisterRequestDTO {
  String? email;
  String? password;
  String? name;
  String? surname;

  RegisterRequestDTO({this.email, this.password, this.name, this.surname});

  RegisterRequestDTO.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    surname = json['surname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    data['surname'] = surname;
    return data;
  }
}
