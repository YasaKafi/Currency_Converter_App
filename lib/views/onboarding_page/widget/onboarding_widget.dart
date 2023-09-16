import 'package:currency_converter/helpers/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//On Boarding Content
class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 170,
        ),
        SvgPicture.asset(
          image,
          height: 220,
          width: 280,
        ),
        SizedBox(height: 40),
        Container(
          width: 260,
          child: Text(title,
              textAlign: TextAlign.center, style: onboardingHeaderTextStyle),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SizedBox(
            width: 300,
            child: Text(description,
                textAlign: TextAlign.center,
                style: onboardingSubHeaderTextStyle),
          ),
        ),
        Spacer(),
      ],
    );
  }
}

//List On Boarding Content
class OnBoardingContentList {
  final List<OnBoardingContent> list_on_board = [
    OnBoardingContent(
      image: 'assets/currency-calculator.svg',
      title: "Convert Currency Fast",
      description:
          "Enter the amount you choose to convert, see results instantly without \nwasting time.",
    ),
    OnBoardingContent(
      image: 'assets/digital-currency.svg',
      title: "See Latest Live Rates!",
      description: "Easily check the latest rates and know all details.",
    ),
  ];
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isActive ? 8 : 6,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isActive ? primaryColor : primaryColor.withOpacity(0.5),
      ),
    );
  }
}

class ButtonOnBoard extends StatelessWidget {
  final String text;

  const ButtonOnBoard({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 250,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey, // Warna bayangan
            offset: Offset(0, 4), // Geser bayangan secara vertikal
            blurRadius: 6, // Jarak blur bayangan
            spreadRadius: 0, // Menyebarkan bayangan
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: primaryColor,
      ),
      child: Center(
        child: Text(
          text,
          style: onboardingButtonTextStyle,
        ),
      ),
    );
  }
}
