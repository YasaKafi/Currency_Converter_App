import 'package:currency_converter/helpers/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        const SizedBox(
          height: 170,
        ),
        SvgPicture.asset(
          image,
          height: 220,
          width: 280,
        ),
        const SizedBox(height: 40),
        SizedBox(
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
        const Spacer(),
      ],
    );
  }
}


class OnBoardingContentList {
  final List<OnBoardingContent> list_on_board = [
    const OnBoardingContent(
      image: 'assets/currency-calculator.svg',
      title: "Convert Currency Fast",
      description:
          "Enter the amount you choose to convert, see results instantly without \nwasting time.",
    ),
    const OnBoardingContent(
      image: 'assets/tedika.svg',
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
      duration: const Duration(milliseconds: 300),
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.0505,
      width: screenWidth * 0.6,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.grey, 
            offset: Offset(0, 4), 
            blurRadius: 6, 
            spreadRadius: 0, 
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
