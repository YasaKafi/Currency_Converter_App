import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:currency_converter/helpers/themes.dart';
import 'package:currency_converter/views/onboarding_page/onboarding_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnBoardingScreen()));
    });
  }

  static const colorizeColors = [
    primaryColor,
    primaryTextColorWhite,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(bottom: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/currency-splash.gif'),
              AnimatedTextKit(
                repeatForever: false,
                totalRepeatCount: 1,
                animatedTexts: [
                  ColorizeAnimatedText('CCurrency',
                      textStyle: splashTextStyle, colors: colorizeColors),
                  ColorizeAnimatedText('CCurrency',
                      textStyle: splashTextStyle, colors: colorizeColors),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
