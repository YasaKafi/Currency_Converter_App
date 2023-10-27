import 'package:currency_converter/app/views/login_page/widget/text_field_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../helpers/themes.dart';
import '../../register_page/view/register_page.dart';
import '../controller/auth_controller.dart';
import '../controller/login_controller.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    super.key,
    required this.loginController,
    required this.authController,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final LoginController loginController;
  final AuthController authController;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth,
      height: screenHeight,
      color: primaryColor,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.0224,
                  left: screenWidth * 0.0485,
                  right: screenWidth * 0.0485),
              child: myTextField(
                controller: loginController.emailController,
                hint: 'Email',
                keyboardInput: TextInputType.emailAddress,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.0124,
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.0224,
                    left: screenWidth * 0.0485,
                    right: screenWidth * 0.0485),
                child: InputTextFormPassword(
                  hint: 'Password',
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.0224,
                    left: screenWidth * 0.0485,
                    right: screenWidth * 0.0485),
                child: Text(
                  'Forgot Password?',
                  style: forgotTextStyle,
                )),
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.0224,
                left: screenWidth * 0.0485,
                right: screenWidth * 0.0485,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: screenHeight * 0.0618,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      loginController.navigateToProfilePage(context);
                    }
                  },
                  // ignore: sort_child_properties_last
                  child: Text(
                    'SIGN IN',
                    style: buttonTextStyle,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryTextColorWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.0224,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.0224,
                  left: screenWidth * 0.0485,
                  right: screenWidth * 0.0485),
              child: Row(
                children: [
                  const Expanded(
                      child: Divider(
                    color: borderColor,
                    thickness: 2,
                    height: 1,
                  )),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.0194),
                    child: Center(
                      child: Text(
                        'or SignUp with',
                        style: orSignUpWith,
                      ),
                    ),
                  ),
                  const Expanded(
                      child: Divider(
                    color: borderColor,
                    height: 1,
                    thickness: 2,
                  )),
                ],
              ),
            ),
             SizedBox(height: screenHeight * 0.0124),
            Padding(
              padding:  EdgeInsets.only(top: screenHeight * 0.0224,
                    left: screenWidth * 0.0485,
                    right: screenWidth * 0.0485),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: screenHeight * 0.0518,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primaryColor,
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      child: TextButton.icon(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        onPressed: () async {
                          // Tambahkan logika untuk menangani tombol Google
                          authController.signInWithGoogle(context);
                        },
                        icon: SvgPicture.asset('assets/logo_google.svg',
                            width: screenWidth * 0.0582, height: screenHeight * 0.02697),
                        label: Text(
                          'Sign Up with Google',
                          style: buttonTextGoogle,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.0194),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: screenHeight * 0.0518,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey, // Warna border
                          width: 2.0, // Lebar border
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          padding: const EdgeInsets.all(2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: SvgPicture.asset('assets/logo_apple.svg',
                            width: screenWidth * 0.192, height: screenHeight * 0.0518),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.0194),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: screenHeight * 0.0518,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          padding: const EdgeInsets.all(6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: SvgPicture.asset('assets/logo_facebook.svg',
                            width: screenWidth * 0.0969, height: screenHeight * 0.0449),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
