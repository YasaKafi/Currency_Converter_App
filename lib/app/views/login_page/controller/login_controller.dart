import 'package:currency_converter/app/views/navigation_bar/navigation_bar.dart';
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
        builder: (context) => BottomNavBar(),
      ),
    );
  }
}
