import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../home_page/view/home_page.dart';

class AuthControllerRegister {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  // Fungsi untuk login dengan Google
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      if (_auth.currentUser == null) {
        final GoogleSignInAccount? account = await _googleSignIn.signIn();

        if (account != null) {
          final GoogleSignInAuthentication auth = await account.authentication;
          final OAuthCredential credential = GoogleAuthProvider.credential(
            accessToken: auth.accessToken,
            idToken: auth.idToken,
          );

          await _auth.signInWithCredential(credential);

          // Navigasi ke halaman utama
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomePage(
                phoneNumber: '',
                email: '',
                name: '',
              ),
            ),
          );
        }
      } else {
        _googleSignIn.signOut();
        _auth.signOut();
        showNotification(context, 'Anda telah logout.');
      }
    } catch (e) {
      // Handle error, jika diperlukan
      // ignore: avoid_print
      print('Error: $e');
    }
  }

  Future<void> handleAuthentication(BuildContext context) async {
    if (_auth.currentUser == null) {
      try {
        await _auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomePage(
                phoneNumber: '',
                email: '',
                name: '',
              ),
            ),
          );
      // ignore: unused_catch_clause
      } on FirebaseAuthException catch (e) {
        // Handle error here
        showNotification(context, 'Errorr.');
      }
    } else {
      await _auth.signOut();
    }
  }

  void showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: const Color.fromARGB(255, 174, 174, 174),
        content: Text(message.toString())));
  }
}
