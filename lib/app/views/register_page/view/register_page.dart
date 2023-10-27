// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:currency_converter/app/views/register_page/controller/register_controller.dart';
import 'package:flutter/material.dart';

import '../../../../helpers/themes.dart';
import '../controller/auth_controller.dart';
import '../widget/form_register.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegisterController registerController = RegisterController();
  final AuthControllerRegister authController = AuthControllerRegister();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primaryTextColorWhite,
      body: Stack(
        children: [
          Positioned(
            top: -screenHeight * 0.0416,
            left: -screenWidth * 0.3276,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 150, top: 180),
                child: Text(
                  'Create\nAccount',
                  style: loginHeaderTextStyle,
                ),
              ),
              width: screenWidth * 1.2491,
              height: screenHeight * 0.4717,
            ),
          ),
          Positioned(
            top: -screenHeight * 0.0786,
            right: -screenWidth * 0.4370,
            child: Container(
              width: screenWidth * 0.8703,
              height: screenHeight * 0.3368,
              decoration: const ShapeDecoration(
                color: primaryColor,
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.3255,
            child: FormRegister(formKey: _formKey, registerController: registerController),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: forgotTextStyle,
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
                      style: buttonTextGoogle,
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


