import 'package:butter/config/routes/routes.dart';
import 'package:butter/view/screens/account_screen/account_screen.dart';
import 'package:butter/view/screens/auth/login/login.dart';
import 'package:butter/view/screens/launch/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'config/theme/app_theme.dart';
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
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,
          translations: Localization(),
          fallbackLocale: Localization.fallBackLocale,
          theme: AppTheme.lightTheme(),
          getPages: AppRoutes.appRoutes(),
          defaultTransition: Transition.fadeIn,
        );
      },
    );
  }
}
