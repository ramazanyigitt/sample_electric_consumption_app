import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static AppTheme? _instance;

  AppTheme._();

  factory AppTheme() => _instance ??= AppTheme._();

  final primaryColor = Color.fromARGB(255, 75, 105, 241);
  final darkPrimaryColor = Color(0xff3A58E3);
  final blackColor = Color.fromARGB(255, 55, 59, 66);
  final greyScale0 = Color.fromARGB(255, 30, 34, 43);
  final greyScale1 = Color.alphaBlend(
      Color.fromRGBO(0, 0, 0, 0.20), Color.fromARGB(255, 62, 69, 84));
  final greyScale2 = Color.fromARGB(255, 108, 113, 122);
  final greyScale3 = Color(0xff8D9096);
  final greyScale4 = Color.fromARGB(255, 194, 198, 206);
  final greyScale5 = Color.fromARGB(255, 248, 249, 251);
  final greyScale6 = Color.fromARGB(255, 250, 251, 253);
  final whiteColor = Color.fromARGB(255, 255, 255, 255);
  final bgColor = Color(0xffFDFDFD);

  final boxBorderForShadow = Border.all(
    color: const Color(0xff828282).withOpacity(0.1),
    width: 1,
  );
  final boxShadowSmall = BoxShadow(
    color: Colors.black.withOpacity(0.05),
    offset: Offset(0, 2),
    blurRadius: 114,
    blurStyle: BlurStyle.solid,
  );

  ///size: `30`
  ///weight `600`
  final headingText = GoogleFonts.poppins(
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );

  ///size: `25`
  ///weight `700`
  final largeParagraphBoldText = GoogleFonts.poppins(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  ///size: `21`
  ///weight `700`
  final paragraphBoldText = GoogleFonts.poppins(
    fontSize: 21,
    fontWeight: FontWeight.bold,
  );

  ///size: `21`
  ///weight `600`
  final paragraphSemiBoldText = GoogleFonts.poppins(
    fontSize: 21,
    fontWeight: FontWeight.w600,
  );

  ///size: `21`
  ///weight `500`
  final paragraphMediumText = GoogleFonts.poppins(
    fontSize: 21,
    fontWeight: FontWeight.w500,
  );

  ///size: `21`
  ///weight `400`
  final paragraphRegularText = GoogleFonts.poppins(
    fontSize: 21,
    fontWeight: FontWeight.w400,
  );

  ///size: `21`
  ///weight `600`
  final buttonText = GoogleFonts.poppins(
    fontSize: 21,
    fontWeight: FontWeight.w600,
  );

  ///size: `16`
  ///weight `600`
  final smallParagraphSemiBoldText = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  ///size: `16`
  ///weight `400`
  final smallParagraphRegularText = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  ///size: `16`
  ///weight `500`
  final smallParagraphMediumText = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  ///size: `14`
  ///weight `600`
  final extraSmallParagraphSemiBoldText = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  ///size: `14`
  ///weight `400`
  final extraSmallParagraphRegularText = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  ///size: `14`
  ///weight `500`
  final extraSmallParagraphMediumText = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}

extension ColorExtension on TextStyle {
  TextStyle get extraSmall12 => copyWith(fontSize: 12);
  TextStyle get extraSmall => copyWith(fontSize: 14);
  TextStyle get small => copyWith(fontSize: 16);
  TextStyle get normal => copyWith(fontSize: 18);
  TextStyle get mediumSmall => copyWith(fontSize: 21);
  TextStyle get mediumLarge => copyWith(fontSize: 25);
  TextStyle get large => copyWith(fontSize: 30);
  TextStyle get extraLarge => copyWith(fontSize: 35);
  TextStyle get extraExtraLarge => copyWith(fontSize: 40);
  TextStyle get extraExtraExtraLarge => copyWith(fontSize: 45);
  TextStyle get extraExtraExtraExtraLarge => copyWith(fontSize: 50);

  TextStyle get primaryColor => copyWith(color: AppTheme().primaryColor);

  TextStyle get greyScale0 => copyWith(color: AppTheme().greyScale0);
  TextStyle get greyScale1 => copyWith(color: AppTheme().greyScale1);
  TextStyle get greyScale2 => copyWith(color: AppTheme().greyScale2);
  TextStyle get greyScale3 => copyWith(color: AppTheme().greyScale3);
  TextStyle get greyScale4 => copyWith(color: AppTheme().greyScale4);
  TextStyle get greyScale5 => copyWith(color: AppTheme().greyScale5);
  TextStyle get greyScale6 => copyWith(color: AppTheme().greyScale6);
  TextStyle get whiteColor => copyWith(color: AppTheme().whiteColor);
  TextStyle get bgColor => copyWith(color: AppTheme().bgColor);
  TextStyle get letterSpaceLow => copyWith(letterSpacing: 0.22);
  TextStyle get letterSpaceNormal => copyWith(letterSpacing: 0.44);
  TextStyle get letterSpaceHigh => copyWith(letterSpacing: 0.66);
  TextStyle get transBlackColor =>
      copyWith(color: Color.fromRGBO(31, 31, 75, 0.5));
  TextStyle get blackColorWithOpacity7 =>
      copyWith(color: Color.fromRGBO(31, 31, 75, 0.7));
  TextStyle get whiteColorWithOpacity7 =>
      copyWith(color: AppTheme().whiteColor.withOpacity(0.7));
  TextStyle get whiteColorWithOpacity8 =>
      copyWith(color: AppTheme().whiteColor.withOpacity(0.8));
  TextStyle get whiteColorWithOpacity9 =>
      copyWith(color: AppTheme().whiteColor.withOpacity(0.9));
}
