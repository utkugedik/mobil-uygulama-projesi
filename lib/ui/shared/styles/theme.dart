import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobil_programlama_odev/ui/shared/extensions/color_extensions.dart';
import 'colors.dart';

class ThemeStyle {
  static ThemeData customThemeData() {
    AppBarTheme _getAppBarTheme() => const AppBarTheme(
          elevation: 0.7,
          iconTheme: IconThemeData(color: AppColors.touchBlack),
        );

    return ThemeData(
      primaryColor: AppColors.mainColor,
      primarySwatch: AppColors.mainColor.toMaterialColor,
      scaffoldBackgroundColor: Colors.white,
      textTheme: GoogleFonts.nunitoSansTextTheme(),
      appBarTheme: _getAppBarTheme(),
    );
  }
}
