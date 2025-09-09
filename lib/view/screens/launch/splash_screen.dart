import 'package:butter/constants/app_fonts.dart';
import 'package:butter/view/screens/launch/select_login_screen.dart';
import 'package:butter/view/screens/onboarding/select_language_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:butter/view/screens/auth/login/login.dart';

import '../../../constants/app_colors.dart';
import '../../../generated/assets.dart';
import '../../widget/common_image_view_widget.dart';
import '../../widget/my_text_widget.dart';
import '../onboarding/onboarding_create_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Get.to(() => const SelectLoginScreen());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kYellowColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Column(
                  children: [
                    MyText(
                      text: "Don’t forget the...",
                      size: 16,
                      weight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                    SizedBox(height: 10,),
                    MyText(
                      text: "butter".tr,
                      size: 80,
                      weight: FontWeight.w400,
                      color: kPrimaryColor,
                      fontFamily: AppFonts.caprasimo,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
