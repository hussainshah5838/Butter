import 'package:butter/constants/app_colors.dart';
import 'package:butter/constants/app_fonts.dart' show AppFonts;
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      fontFamily: AppFonts.inter,
      useMaterial3: true,
      scaffoldBackgroundColor: kWhiteBgColor,
      appBarTheme: AppBarTheme(backgroundColor: kWhiteBgColor),
    );
  }
}
