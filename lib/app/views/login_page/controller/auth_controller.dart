import 'package:currency_converter/app/views/navigation_bar/navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../home_page/view/home_page.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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
              builder: (context) => const BottomNavBar(
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

 

  void showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: const Color.fromARGB(255, 174, 174, 174),
        content: Text(message.toString())));
  }
}
