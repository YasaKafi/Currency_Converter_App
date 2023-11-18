import 'package:currency_converter/app/views/home_page/view/home_page.dart';
import 'package:currency_converter/app/views/login_page/view/login_page.dart';
import 'package:currency_converter/app/views/navigation_bar/navigation_bar.dart';
import 'package:flutter/material.dart';

class OnBoardController {

    void navigateToNextPage(PageController pageController) {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void navigateToStart(BuildContext context) {

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>  LoginPage(),
      ),
    );
  }
}

