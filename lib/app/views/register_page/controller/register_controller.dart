import 'package:flutter/material.dart';

import '../../home_page/view/home_page.dart';

class RegisterController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  void dispose() {
    emailController.dispose();
    nameController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
  }

  void navigateToProfilePage(BuildContext context) {
    String email = emailController.text;
    String name = nameController.text;
    String phoneNumber = phoneNumberController.text;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            HomePage(),
      ),
    );
  }
}
