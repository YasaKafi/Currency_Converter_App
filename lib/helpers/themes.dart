import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//COLOR
const Color primaryColor = Color.fromRGBO(64, 61, 86,1);
const Color primaryTextColor = Color.fromRGBO(46, 46, 65, 1);
const Color hintTextColor = Color.fromRGBO(210, 210, 214, 1);
const Color primaryTextColorWhite = Color.fromRGBO(252, 252, 255, 1);
const Color lineColor = Color.fromRGBO(181, 181, 181, 1);
const Color offButtonColor = Color.fromRGBO(203, 203, 203, 1);
const Color warningColor = Color.fromRGBO(143, 42, 42, 1);
const Color borderColor = Color.fromRGBO(138, 136, 136, 1);


figmaFontsize(double fontSize) {
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

TextStyle pageHeaderTextStyle = GoogleFonts.raleway(
    textStyle: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.bold,
        fontSize: figmaFontsize(30)
    )
);

TextStyle loginHeaderTextStyle = GoogleFonts.raleway(
    textStyle: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.bold,
        fontSize: figmaFontsize(38)
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
        fontSize: figmaFontsize(14)
    )
);

TextStyle dropdownTextStyle = GoogleFonts.raleway(
    textStyle: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.w600,
        fontSize: figmaFontsize(24)
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
        color: primaryTextColorWhite,
        fontWeight: FontWeight.w400,
        fontSize: figmaFontsize(17)
    )
);
TextStyle hintTextStylB = GoogleFonts.raleway(
    textStyle: TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.w400,
        fontSize: figmaFontsize(17)
    )
);

TextStyle forgotTextStyle = GoogleFonts.raleway(
    textStyle: TextStyle(
        color: primaryTextColorWhite,
        fontWeight: FontWeight.w400,
        fontSize: figmaFontsize(14)
    )
);
TextStyle forgotTextStyleB = GoogleFonts.raleway(
    textStyle: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.w400,
        fontSize: figmaFontsize(14)
    )
);

TextStyle buttonTextStyle = GoogleFonts.raleway(
    textStyle: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.w700,
        fontSize: figmaFontsize(22)
    )
);

TextStyle buttonTextStyleW = GoogleFonts.raleway(
    textStyle: TextStyle(
        color: primaryTextColorWhite,
        fontWeight: FontWeight.w700,
        fontSize: figmaFontsize(22)
    )
);

TextStyle buttonTextGoogle = GoogleFonts.raleway(
    textStyle: TextStyle(
        color: primaryTextColorWhite,
        fontWeight: FontWeight.w600,
        fontSize: figmaFontsize(12)
    )
);

TextStyle buttonTextGoogleB = GoogleFonts.raleway(
    textStyle: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.w600,
        fontSize: figmaFontsize(12)
    )
);

TextStyle orSignUpWith = GoogleFonts.raleway(
    textStyle: TextStyle(
        color: borderColor,
        fontWeight: FontWeight.w600,
        fontSize: figmaFontsize(12)
    )
);

TextStyle textFieldInput = GoogleFonts.raleway(
    textStyle: TextStyle(
        color: primaryTextColorWhite,
        fontWeight: FontWeight.w500,
        fontSize: figmaFontsize(18)
    )
);

TextStyle textFieldInputB = GoogleFonts.raleway(
    textStyle: TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.w500,
        fontSize: figmaFontsize(18)
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
TextStyle amountTextStyle({required double fontSize}) {
  return GoogleFonts.montserrat(
      textStyle: TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.w600 ,
        fontSize: figmaFontsize(fontSize),
      )
  );
}
TextStyle profileTextStyle({
  required final color,
  required final fontWeight,
  required final  double fontSize,
}) {
  return GoogleFonts.sora(
      textStyle: TextStyle(
    color: color,
    fontWeight: fontWeight,
    fontSize: figmaFontsize(fontSize),
  ));
}

TextStyle buttonStyle({required final color}) {
  return GoogleFonts.montserrat(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: figmaFontsize(24)
      )
  );
}

TextStyle appBarText = GoogleFonts.rubik(
    textStyle: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.w600,
        fontSize: figmaFontsize(18)
    )
);



//IMAGE ASSETS
String bigLogo = "assets/logo/courdev-big.svg";
String smallLogo = "assets/logo/courdev-small.svg";
