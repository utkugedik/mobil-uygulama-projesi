import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/colors.dart';

class AppTextStyles {
  ///h2
  static TextStyle h2 = _getTextStyle(30, FontWeight.normal);
  static TextStyle h2ExtraBold = _getTextStyle(30, FontWeight.w900);

  ///h3
  static TextStyle h3 = _getTextStyle(24, FontWeight.normal);
  static TextStyle h3Bold = _getTextStyle(24, FontWeight.w700);
  static TextStyle h3ExtraBold = _getTextStyle(24, FontWeight.w900);

  ///h4
  static TextStyle h4 = _getTextStyle(20, FontWeight.normal);
  static TextStyle h4ExtraBold = _getTextStyle(20, FontWeight.w800);

  ///p1
  static TextStyle p1 = _getTextStyle(18, FontWeight.normal);
  static TextStyle p1SemiBold = _getTextStyle(18, FontWeight.w600);
  static TextStyle p1Bold = _getTextStyle(18, FontWeight.w700);
  static TextStyle p1ExtraBold = _getTextStyle(18, FontWeight.w900);

  ///p2
  static TextStyle p2 = _getTextStyle(16, FontWeight.normal);
  static TextStyle p2Medium = _getTextStyle(16, FontWeight.w500);
  static TextStyle p2Bold = _getTextStyle(16, FontWeight.w700);
  static TextStyle p2ExtraBold = _getTextStyle(16, FontWeight.w900);

  ///p3
  static TextStyle p3 = _getTextStyle(14, FontWeight.normal);
  static TextStyle p3SemiBold = _getTextStyle(14, FontWeight.w600);
  static TextStyle p3Bold = _getTextStyle(14, FontWeight.w700);
  static TextStyle p3ExtraBold = _getTextStyle(14, FontWeight.w800);
  static TextStyle p3Medium = p3.copyWith(fontWeight: FontWeight.w500);

  ///p4
  static TextStyle p4 = _getTextStyle(12, FontWeight.normal);
  static TextStyle p4Medium = _getTextStyle(12, FontWeight.w500);
  static TextStyle p4Bold = _getTextStyle(12, FontWeight.w700);
  static TextStyle p4ExtraBold = _getTextStyle(12, FontWeight.w800);

  ///caption
  static TextStyle caption = _getTextStyle(12, FontWeight.normal);
  static TextStyle captionSemiBold = _getTextStyle(12, FontWeight.w600);

  static TextStyle _getTextStyle(
    double fontSize,
    FontWeight fontWeight,
  ) =>
      GoogleFonts.nunitoSans(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: AppColors.touchBlack,
      );
}
