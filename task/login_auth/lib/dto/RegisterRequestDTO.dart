class RegisterRequestDTO{
  String? email;
  String? password;
  String? name;
  String? surname;
  String? phoneNumber;
  String? birthDate;

  RegisterRequestDTO(
      {this.email,
        this.password,
        this.name,
        this.surname,
        this.phoneNumber,
        this.birthDate});

  RegisterRequestDTO.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    surname = json['surname'];
    phoneNumber = json['phoneNumber'];
    birthDate = json['birthDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['phoneNumber'] = this.phoneNumber;
    data['birthDate'] = this.birthDate;
    return data;
  }
}