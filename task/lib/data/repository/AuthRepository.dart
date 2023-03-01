import 'package:test/data/model/dto/LoginRequestDTO.dart';
import 'package:test/data/model/dto/LoginResponseDTO.dart';
import 'package:test/data/model/dto/RegisterRequestDTO.dart';
import 'package:test/data/model/dto/RegisterResponseDTO.dart';
import 'package:test/data/services/auth_service.dart';

class AuthRepository {
  final AuthService _authService = AuthService();

  Future<LoginResponseDTO> login(String email, String password) async {
    //Create dto object
    LoginRequestDTO loginRequestDTO =
        LoginRequestDTO(email: email, password: password);

    //Call service
    return await _authService.login(loginRequestDTO);
  }

  Future<RegisterResponseDTO> register(String email, String password,
      String name, String surname, String phoneNumber, String birthDate) async {
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
}
