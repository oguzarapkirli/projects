import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/data/model/dto/LoginResponseDTO.dart';
import 'package:test/data/repository/AuthRepository.dart';
import 'package:test/data/services/save_service.dart';

import '../ui/HomeScreen.dart';

class LoginController extends GetxController {
  var isPasswordVisible = false.obs;
  var rememberMe = false.obs;
  var isLoading = false.obs;
  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final authRepository = AuthRepository();
  final SaveService saveService = SaveService();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    if (value == null || value.isEmpty) {
      return 'Email alanı boş bırakılamaz';
    } else if (!regex.hasMatch(value)) {
      return 'Geçerli bir email adresi giriniz';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Şifre alanı boş bırakılamaz';
    } else if (value.length < 6) {
      return 'Şifre en az 6 karakter olmalıdır';
    }
    return null;
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      LoginResponseDTO response = await authRepository.login(
          emailController.text, passwordController.text);
      isLoading.value = false;
      if (response.statusCode == HttpStatus.ok) {
        // Save token to shared preferences
        saveService.saveToken(response.data!);
        // Navigate to home screen
        Get.offAll(() => const HomeScreen());
      } else {
        // if login fails, show snackbar
        ScaffoldMessenger.of(Get.context!)
            .showSnackBar(SnackBar(content: Text(response.message!)));
      }
    }
  }
}
