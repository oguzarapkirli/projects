import 'dart:io';

import 'package:dio/dio.dart';
import 'package:test/data/model/dto/LoginRequestDTO.dart';
import 'package:test/data/model/dto/LoginResponseDTO.dart';
import 'package:test/data/model/dto/RegisterRequestDTO.dart';
import 'package:test/data/model/dto/RegisterResponseDTO.dart';

class AuthService {
  final Dio _dio = Dio();
  static const String BASE_URL = 'http://185.169.54.83:5001/';

  // Login function
  Future<LoginResponseDTO> login(LoginRequestDTO loginRequestDTO) async {
    try {
      Response response = await _dio.post(
        '${BASE_URL}auth/customer/login',
        options: Options(
          headers: {
            'Store': '2d87004e-41df-4064-a4da-84945e57abd3',
          },
        ),
        data: loginRequestDTO.toJson(),
      );
      print(response);
      print(response.data);
      print(response.statusCode);

      if (response.statusCode == HttpStatus.ok) {
        return LoginResponseDTO.fromJson(response.data);
      } else {
        return LoginResponseDTO.fromJson({
          'message': response.statusMessage,
        });
      }
    } catch (e) {
      return LoginResponseDTO.fromJson({
        'message': e.toString(),
      });
    }
  }

  // Register function
  Future<RegisterResponseDTO> register(
      RegisterRequestDTO registerRequestDTO) async {
    try {
      Response response = await _dio.post(
        '${BASE_URL}auth/customer/register',
        options: Options(
          headers: {
            'Store': '2d87004e-41df-4064-a4da-84945e57abd3',
          },
        ),
        data: registerRequestDTO.toJson(),
      );

      if (response.statusCode == HttpStatus.created) {
        return RegisterResponseDTO.fromJson(response.data);
      } else {
        return RegisterResponseDTO.fromJson({
          'message': response.statusMessage,
        });
      }
    } catch (e) {
      return RegisterResponseDTO.fromJson({
        'message': e.toString(),
      });
    }
  }
}
