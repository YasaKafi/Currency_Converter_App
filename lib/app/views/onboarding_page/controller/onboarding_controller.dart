import 'package:flutter/material.dart';

import '../../navigation_bar/navigation_bar.dart';

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
        builder: (context) => const BottomNavBar(),
      ),
    );
  }
}

