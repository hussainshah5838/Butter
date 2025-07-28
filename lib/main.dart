import 'package:butter/view/screens/Account/account_screen.dart';
import 'package:butter/view/screens/Activity/activity_screen.dart';
import 'package:butter/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:butter/view/screens/categories/categories_screen.dart';
import 'package:butter/view/screens/launch/select_login_screen.dart';
import 'package:butter/view/screens/launch/splash_screen.dart';
import 'package:butter/view/screens/onboarding/add_tap_and_speak_screen.dart';
import 'package:butter/view/screens/onboarding/add_voice_confirm_screen.dart';
import 'package:butter/view/screens/onboarding/onboarding_create_screen.dart';
import 'package:butter/view/screens/onboarding/onboarding_household_screen.dart';
import 'package:butter/view/screens/onboarding/onboarding_name_screen.dart';
import 'package:butter/view/screens/onboarding/onboarding_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'constants/app_colors.dart';
import 'constants/app_fonts.dart';
import 'constants/app_theme.dart';
import 'localization/controller.dart';
import 'localization/user_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSimplePreferences.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      translations: Localization(),
      fallbackLocale: Localization.fallBackLocale,
      theme: AppTheme.lightTheme(),
      home: AccountScreen(),
      defaultTransition: Transition.fadeIn,
    );
  }
}
