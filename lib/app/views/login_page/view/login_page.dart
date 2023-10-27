// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:currency_converter/helpers/themes.dart';
import 'package:currency_converter/app/views/login_page/controller/auth_controller.dart';
import 'package:currency_converter/app/views/login_page/controller/login_controller.dart';
import 'package:flutter/material.dart';

import '../../register_page/view/register_page.dart';
import '../widget/form_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController loginController = LoginController();
  final AuthController authController = AuthController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Positioned(
            top: -screenHeight * 0.0416,
            left: -screenWidth * 0.3276,
            child: Container(
              // ignore: sort_child_properties_last
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.3638, top: screenHeight * 0.2023),
                child: Text(
                  'Welcome\nBack',
                  style: loginHeaderTextStyle,
                ),
              ),
              width: screenWidth * 1.2491,
              height: screenHeight * 0.4717,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            top: -screenHeight * 0.0562,
            right: -screenWidth * 0.5829,
            child: Container(
              width: screenWidth * 1.1114,
              height: screenHeight * 0.4487,
              decoration: const ShapeDecoration(
                color: primaryColor,
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.4487,
            child: SingleChildScrollView(
              child: FormLogin(
                loginController: loginController,
                authController: authController,
                formKey: _formKey,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: primaryTextColorWhite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: forgotTextStyleB,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ));
                    },
                    child: Text(
                      'SIGN UP',
                      style: buttonTextGoogleB,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
