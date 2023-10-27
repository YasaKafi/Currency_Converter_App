import 'package:flutter/material.dart';

import '../../home_page/view/home_page.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();

  void dispose() {
    emailController.dispose();
  }

  void navigateToProfilePage(BuildContext context) {
    String email = emailController.text;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HomePage(email: email, name: 'null',phoneNumber: 'null'),
      ),
    );
  }
}
