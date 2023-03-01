class LoginResponseDTO {
  int? statusCode;
  String? message;
  String? data;

  LoginResponseDTO({this.statusCode, this.message, this.data});

  LoginResponseDTO.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
