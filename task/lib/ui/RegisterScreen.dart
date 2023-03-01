import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:test/controller/RegisterController.dart';

import '../util/constant/appColors.dart';
import 'LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //Controller
  final controller = Get.put(RegisterController());

  String? countryValue;
  String? stateValue;
  String? cityValue;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: (controller.isLoading.value)
            ? const Center(child: CircularProgressIndicator())
            : _buildBody(context),
      ),
    );
  }

  Padding _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/logo.svg',
            height: 75,
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Kayıt Ol',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                onPressed: () => Get.offAll(
                  () => const LoginScreen(),
                  transition: Transition.rightToLeft,
                ),
                child: Text(
                  'Giriş Yap',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.emailController,
                    autofillHints: const [AutofillHints.email],
                    keyboardType: TextInputType.emailAddress,
                    validator: controller.validateEmail,
                    maxLines: 1,
                    maxLength: 50,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      counterText: '',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.nameController,
                    autofillHints: const [AutofillHints.name],
                    keyboardType: TextInputType.name,
                    validator: controller.validateName,
                    maxLines: 1,
                    maxLength: 50,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      hintText: 'Ad Soyad',
                      counterText: '',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'Ülke',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.arrow_drop_down),
                        color: Colors.white,
                        onPressed: () => _openCountryPickerDialog(context),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.passwordController,
                    autofillHints: const [AutofillHints.password],
                    keyboardType: TextInputType.visiblePassword,
                    validator: controller.validatePassword,
                    maxLines: 1,
                    maxLength: 50,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: !controller.isPasswordVisible.value,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      counterText: '',
                      suffixIcon: IconButton(
                        icon: true
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        color: Colors.white,
                        onPressed: () => controller.isPasswordVisible.toggle(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () => controller.register(),
                      child: const Text(
                        'Kayıt ol',
                        style: TextStyle(
                          color: appRed,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('yada'),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => print("Login with Google"),
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(15),
                          backgroundColor: Colors.white,
                          foregroundColor: appRed,
                        ),
                        child: const FaIcon(
                          FontAwesomeIcons.google,
                        ),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () => print("Login with Facebook"),
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(15),
                          backgroundColor: Colors.white,
                          foregroundColor: appRed,
                        ),
                        child: const FaIcon(
                          FontAwesomeIcons.facebookF,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openCountryPickerDialog(BuildContext context) {
    //TODO cant implement country picker
  }
}
