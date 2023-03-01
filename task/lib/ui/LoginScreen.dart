import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:test/ui/RegisterScreen.dart';
import 'package:test/util/constant/appColors.dart';

import '../controller/LoginController.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Controller
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: (controller.isLoading.value)
            ? const Center(child: CircularProgressIndicator())
            : buildBody(context),
      ),
    );
  }

  Padding buildBody(BuildContext context) {
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
              TextButton(
                onPressed: () => Get.offAll(
                  () => const RegisterScreen(),
                  transition: Transition.rightToLeft,
                ),
                child: Text(
                  'Kayıt Ol',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Text(
                'Giriş Yap',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 40),
          SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  _buildEmailFormField(),
                  const SizedBox(height: 20),
                  _buildPasswordFormField(),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => print("Goto sifremi unuttum"),
                      child: Text(
                        'Şifremi Unuttum',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.toggleRememberMe(),
                      ),
                      const Text('Beni Hatırla'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () => controller.login(),
                      child: const Text(
                        'Giriş Yap',
                        style: TextStyle(
                          color: appRed,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('ya da'),
                  const SizedBox(height: 20),
                  _buildSocialLoginRow(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _buildSocialLoginRow() {
    return Row(
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
    );
  }

  TextFormField _buildPasswordFormField() {
    return TextFormField(
      controller: controller.passwordController,
      obscureText: !controller.isPasswordVisible.value,
      keyboardType: TextInputType.visiblePassword,
      autofillHints: const [AutofillHints.password],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofocus: true,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(r'[a-zA-Z0-9!@#$%^&*(),.?":{}|<>]'),
        ),
      ],
      maxLength: 20,
      maxLines: 1,
      validator: (value) => controller.validatePassword(value ?? ''),
      decoration: InputDecoration(
        hintText: 'Password',
        counterText: '',
        suffixIcon: IconButton(
          icon: controller.isPasswordVisible.value
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
          color: Colors.white,
          onPressed: () => controller.togglePasswordVisibility(),
        ),
      ),
    );
  }

  TextFormField _buildEmailFormField() {
    return TextFormField(
      controller: controller.emailController,
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email],
      autofocus: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLength: 50,
      maxLines: 1,
      validator: (value) => controller.validateEmail(value ?? ''),
      decoration: const InputDecoration(
        hintText: 'Email',
        counterText: '',
      ),
    );
  }
}
