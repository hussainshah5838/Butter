import 'package:butter/config/constants/app_colors.dart';
import 'package:butter/config/constants/app_fonts.dart' show AppFonts;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      fontFamily: AppFonts.inter,
      splashColor: Colors.transparent,
      useMaterial3: true,
      scaffoldBackgroundColor: kWhiteBgColor,
      appBarTheme: AppBarTheme(backgroundColor: kWhiteBgColor),

      /// Bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: kWhiteBgColor,
        selectedItemColor: kBlackColor,
        elevation: 4,
        unselectedItemColor: Colors.black.withValues(alpha: 0.50),
        selectedLabelStyle: TextStyle(
          fontFamily: AppFonts.inter,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: AppFonts.inter,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
      ),

      /// floating action button theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: kBlackColor,
      ),
    );
  }
}
