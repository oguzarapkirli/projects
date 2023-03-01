import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/ui/HomeScreen.dart';
import 'package:test/ui/widgets/WelcomeOne.dart';
import 'package:test/ui/widgets/WelcomeThree.dart';

import '../ui/widgets/WelcomeTwo.dart';

class WelcomeController extends GetxController {
  var isLoading = false.obs;

  var page = 0.obs;

  var pages = [
    const WelcomeOne(),
    const WelcomeTwo(),
    const WelcomeThree(),
  ];

  late TabController tabController;

  @override
  void onInit() {
    isLoggedIn();
    super.onInit();
  }

  Future<void> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') != null) {
      print("Found this token in shared preferences: ${prefs.getString('token')} going to home");
      Get.offAll(() => const HomeScreen());
    }
  }
}
