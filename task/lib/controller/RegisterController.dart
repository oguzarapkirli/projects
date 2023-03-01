import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/data/repository/AuthRepository.dart';
import 'package:test/data/services/save_service.dart';
import 'package:test/ui/HomeScreen.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  var isPasswordVisible = false.obs;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  final AuthRepository _authRepository = AuthRepository();
  final SaveService _saveService = SaveService();

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    if (value!.isEmpty) {
      return 'Email alanı boş bırakılamaz';
    } else if (!regex.hasMatch(value)) {
      return 'Email alanı geçerli bir email adresi olmalıdır';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Şifre alanı boş bırakılamaz';
    } else if (value.length < 6) {
      return 'Şifre alanı en az 6 karakter olmalıdır';
    }
    return null;
  }

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Ad Soyad alanı boş bırakılamaz';
    } else if (value.split(" ").length != 2) {
      return 'Ad Soyad alanı boş bırakılamaz ve arasında boşluk olmalıdır';
    }
    return null;
  }

  Future<void> register() async {
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;

    final splitedName = nameController.text.split(" ");
    var name = splitedName[0];
    var surname = splitedName[1];

    final response = await _authRepository.register(emailController.text,
        passwordController.text, name, surname, "05456467811", "1998-08-04");

    isLoading.value = false;
    if (response.statusCode == HttpStatus.created) {
      //login
      final loginResponse = await _authRepository.login(
          emailController.text, passwordController.text);
      //if login succesfull
      if (loginResponse.statusCode == HttpStatus.ok) {
        _saveService.saveToken(loginResponse.data!);
        Get.offAll(() => const HomeScreen());
      } else {
        ScaffoldMessenger.of(Get.context!)
            .showSnackBar(SnackBar(content: Text(loginResponse.message!)));
      }
      //register error
    } else {
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(SnackBar(content: Text(response.message!)));
    }
  }
}
