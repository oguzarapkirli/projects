import 'package:login_auth/dto/LoginRequestDTO.dart';
import 'package:login_auth/dto/RegisterRequestDTO.dart';
import 'package:login_auth/services/auth_service.dart';

class AuthRepository {
  final AuthService _authService = AuthService();

  Future login(String email, String password) async {
    //Check if email and password are empty
    if (checkNullOrEmpty(email, password)) {
      return null;
    }
    //Create dto object
    LoginRequestDTO loginRequestDTO =
        LoginRequestDTO(email: email, password: password);

    //Call service
    return await _authService.login(loginRequestDTO);
  }

  Future register(String email, String password, String name, String surname,
      String phoneNumber, String birthDate) async {
    //Check if fields are empty
    if (checkNullOrEmpty(
        email, password, name, surname, phoneNumber, birthDate)) {
      return null;
    }
    //Create dto object
    RegisterRequestDTO registerRequestDTO = RegisterRequestDTO(
        email: email,
        password: password,
        name: name,
        surname: surname,
        phoneNumber: phoneNumber,
        birthDate: birthDate);

    //Call service
    return await _authService.register(registerRequestDTO);
  }

  bool checkNullOrEmpty(String email, String password,
      [String? name, String? surname, String? phoneNumber, String? birthDate]) {
    if (email.isEmpty || password.isEmpty) {
      return true;
    } else if (name != null && name.isEmpty) {
      return true;
    } else if (surname != null && surname.isEmpty) {
      return true;
    } else if (phoneNumber != null && phoneNumber.isEmpty) {
      return true;
    } else if (birthDate != null && birthDate.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
