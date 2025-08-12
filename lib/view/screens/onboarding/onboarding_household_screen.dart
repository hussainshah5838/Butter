import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../config/constants/app_fonts.dart';
import '../../../config/routes/routes_name.dart';
import '../../widget/my_button.dart';
import '../../widget/my_text_widget.dart';

class OnboardingHouseholdScreen extends StatelessWidget {
  const OnboardingHouseholdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.23, 0.42),
            radius: 1.04,
            colors: [const Color(0xFFFFEFBC), Colors.white],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(Icons.arrow_back),
                ),
                Spacer(),
                MyText(
                  text: "Nice to meet you,\nRobert ✨",
                  size: 32.sp,
                  weight: FontWeight.w600,
                  fontFamily: AppFonts.lexend,
                  letterSpacing: -1.60,
                ),
                15.verticalSpace,
                MyText(
                  text:
                      "Are we joining an existing household, \nor starting your own?",
                  color: Colors.black.withValues(alpha: 0.50),
                  size: 16.sp,
                  weight: FontWeight.w300,
                ),
                Spacer(),
                Spacer(),
                MyButton(
                  buttonText: "Join a household",
                  fontSize: 16.sp,
                  onTap:
                      () =>
                          Get.toNamed(RouteName.onboardingHouseholdJoinScreen),
                  height: 50.h,
                ),
                15.verticalSpace,
                MyButton(
                  buttonText: "Start my own",
                  fontSize: 16.sp,
                  onTap: () => Get.toNamed(RouteName.onboardingCreateScreen),
                  height: 50.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
