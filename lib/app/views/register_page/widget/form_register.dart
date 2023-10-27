import 'package:currency_converter/app/views/register_page/widget/widget_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../helpers/themes.dart';
import '../../login_page/view/login_page.dart';
import '../controller/register_controller.dart';

class FormRegister extends StatelessWidget {
  const FormRegister({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.registerController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final RegisterController registerController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: primaryTextColorWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: myTextFieldB(
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                          return 'Enter Correct Name';
                        }
                        return null;
                      },
                      controller: registerController.nameController,
                      hint: 'Name',
                      keyboardInput: TextInputType.name,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: myTextFieldB(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                                  .hasMatch(value!)) {
                            return 'Enter Correct Email';
                          }
                          return null;
                        },
                        controller: registerController.emailController,
                        hint: 'Email',
                        keyboardInput: TextInputType.emailAddress,
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: InputTextFormPasswordC(
                      controller: registerController.phoneNumberController,
                      keyboardInput: TextInputType.phone,
                      hint: 'PhoneNumber',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: InputTextFormPasswordB(
                        hint: 'Password',
                      )),
                ],
              )),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 55,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    registerController.navigateToProfilePage(context);
                  }
                },
                child: Text(
                  'SIGN UP',
                  style: buttonTextStyleW,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              children: [
                const Expanded(
                    child: Divider(
                  color: borderColor,
                  thickness: 2,
                  height: 1,
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryTextColorWhite,
                      border: Border.all(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    child: TextButton.icon(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                      ),
                      onPressed: () async {
                        // Tambahkan logika untuk menangani tombol Google
                        if (FirebaseAuth.instance.currentUser == null) {
                          GoogleSignInAccount? account =
                              await GoogleSignIn().signIn();

                          if (account != null) {
                            GoogleSignInAuthentication auth =
                                await account.authentication;
                            OAuthCredential credential =
                                GoogleAuthProvider.credential(
                              accessToken: auth.accessToken,
                              idToken: auth.idToken,
                            );
                            await FirebaseAuth.instance
                                .signInWithCredential(credential);
                          }
                        } else {
                          GoogleSignIn().signOut();
                          FirebaseAuth.instance.signOut();
                        }
                      },
                      icon: SvgPicture.asset('assets/logo_google.svg',
                          width: 24, height: 24),
                      label: Text(
                        'Sign Up with Google',
                        style: buttonTextGoogleB,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 45,
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
                        backgroundColor: primaryTextColorWhite,
                        padding: const EdgeInsets.all(2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: SvgPicture.asset('assets/logo_apple.svg',
                          width: 45, height: 45),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 45,
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
                        backgroundColor: primaryTextColorWhite,
                        padding: const EdgeInsets.all(6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: SvgPicture.asset('assets/logo_facebook.svg',
                          width: 40, height: 40),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}

void showNotification(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.orange.shade900,
      content: Text(message.toString())));
}
