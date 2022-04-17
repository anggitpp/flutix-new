import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

class AppSizes {
  static const double defaultMargin = 26;
}

class AppTextStyle {
  static TextStyle smallText =
      GoogleFonts.raleway(fontSize: 14, color: Colors.black);
  static TextStyle mediumText =
      GoogleFonts.raleway(fontSize: 16, color: Colors.black);
  static TextStyle largeText =
      GoogleFonts.raleway(fontSize: 20, color: Colors.black);

  static TextStyle greySmallText =
      GoogleFonts.raleway(fontSize: 14, color: 'ADADAD'.toColor());
  static TextStyle greyMediumText =
      GoogleFonts.raleway(fontSize: 16, color: 'ADADAD'.toColor());

  static TextStyle currencySmallText =
      GoogleFonts.openSans(fontSize: 14, color: 'ADADAD'.toColor());
}

class AppColors {
  static Color purpleColor = '503E9D'.toColor();
  static Color lightGreyColor = 'E4E4E4'.toColor();
  static Color darkGreyColor = 'BEBEBE'.toColor();
  static Color yellowColor = 'FBD460'.toColor();
  static Color greyColor = 'ADADAD'.toColor();
  static Color darkPurpleColor = '2C1F63'.toColor();
  static Color greenColor = '3E9D9D'.toColor();
}
