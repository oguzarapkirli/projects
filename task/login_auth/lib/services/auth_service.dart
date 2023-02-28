import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:login_auth/dto/LoginRequestDTO.dart';
import 'package:login_auth/dto/RegisterRequestDTO.dart';

import 'ApiResponse.dart';

class AuthService {
  final Dio _dio = Dio();
  static const String BASE_URL = 'http://185.169.54.83:5001/';

  // Login function
  Future<ApiResponse> login(LoginRequestDTO loginRequestDTO) async {
    try {

      Response response = await _dio.post(
        '${BASE_URL}auth/customer/login',
        data: loginRequestDTO.toJson(),
      );

      if (response.statusCode == HttpStatus.ok) {
        Map<String, dynamic> data = json.decode(response.data);
        return ApiResponse.success(data);
      } else {
        return ApiResponse.error(response.statusMessage!);
      }
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  // Register function
  Future<ApiResponse> register(RegisterRequestDTO registerRequestDTO) async {
    try {
      Response response = await _dio.post(
        '${BASE_URL}auth/customer/register',
        data: registerRequestDTO.toJson(),
      );

      if (response.statusCode == HttpStatus.created) {
        Map<String, dynamic> data = json.decode(response.data);
        return ApiResponse.success(data);
      } else {
        return ApiResponse.error(response.statusMessage!);
      }
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
