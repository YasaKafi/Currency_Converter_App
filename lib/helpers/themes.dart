import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//COLOR
const Color primaryColor = Color.fromRGBO(64, 61, 86,1);
const Color primaryTextColor = Color.fromRGBO(46, 46, 65, 1);
const Color hintTextColor = Color.fromRGBO(107, 107, 107, 1);
const Color primaryTextColorWhite = Color.fromRGBO(252, 252, 255, 1);
const Color lineColor = Color.fromRGBO(181, 181, 181, 1);
const Color offButtonColor = Color.fromRGBO(203, 203, 203, 1);
const Color warningColor = Color.fromRGBO(143, 42, 42, 1);


figmaFontsize(int fontSize) {
  return fontSize * 0.95;
}

//FONT STYLES INITIAL
TextStyle onboardingHeaderTextStyle = GoogleFonts.raleway(
    textStyle: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.bold,
        fontSize: figmaFontsize(25)
    )
);

TextStyle onboardingButtonTextStyle = GoogleFonts.raleway(
    textStyle: TextStyle(
        color: primaryTextColorWhite,
        fontWeight: FontWeight.w700,
        fontSize: figmaFontsize(20)
    )
);

TextStyle onboardingSubHeaderTextStyle = GoogleFonts.raleway(
    textStyle: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.w500,
        fontSize: figmaFontsize(16)
    )
);

TextStyle splashTextStyle = GoogleFonts.raleway(
    textStyle: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.bold,
        fontSize: figmaFontsize(36)
    )
);

TextStyle hintTextStyle = GoogleFonts.raleway(
    textStyle: TextStyle(
        color: hintTextColor,
        fontWeight: FontWeight.w400,
        fontSize: figmaFontsize(14)
    )
);

TextStyle sectionTitle = GoogleFonts.raleway(
    textStyle: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.w600,
        fontSize: figmaFontsize(26)
    )
);

TextStyle sectionSlogan = GoogleFonts.raleway(
    textStyle: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.w400,
        fontSize: figmaFontsize(22)
    )
);

TextStyle sloganHomePage = GoogleFonts.raleway(
    textStyle: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.w200,
        fontSize: figmaFontsize(10)
    )
);



TextStyle detailButtonsText({required bool isDelete}) {
  return GoogleFonts.raleway(
      textStyle: TextStyle(
        color: isDelete? warningColor : Colors.white,
        fontWeight: isDelete ? FontWeight.w400 : FontWeight.w600,
        fontSize: isDelete ? figmaFontsize(15) : 18,
      )
  );
}

TextStyle appBarText = GoogleFonts.montserrat(
    textStyle: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.w600,
        fontSize: figmaFontsize(18)
    )
);



//IMAGE ASSETS
String bigLogo = "assets/logo/courdev-big.svg";
String smallLogo = "assets/logo/courdev-small.svg";
