import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_fonts.dart';
import '../../../config/routes/routes_name.dart';
import '../../widget/my_button.dart';
import '../../widget/my_text_widget.dart';

class OnboardingHouseholdJoinScreen extends StatefulWidget {
  const OnboardingHouseholdJoinScreen({super.key});

  @override
  State<OnboardingHouseholdJoinScreen> createState() =>
      _OnboardingHouseholdJoinScreenState();
}

class _OnboardingHouseholdJoinScreenState
    extends State<OnboardingHouseholdJoinScreen> {
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
                Spacer(),
                MyText(
                  text: "Join an existing household",
                  size: 32.sp,
                  weight: FontWeight.w500,
                  fontFamily: AppFonts.lexend,
                  letterSpacing: -1.60,
                ),
                20.verticalSpace,
                MyText(
                  text:
                      "This connects you to their household. Assuming they want you there.",
                  color: Colors.black.withValues(alpha: 0.50),
                  size: 16.sp,
                  weight: FontWeight.w300,
                ),
                35.verticalSpace,
                TextField(
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFonts.lexend,
                  ),
                  cursorColor: kYellowColor,
                  cursorHeight: 35.h,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Secret code...",
                    hintStyle: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.lexend,
                      color: Colors.black.withValues(alpha: 0.20),
                    ),
                  ),
                ),
                Spacer(),
                Spacer(),
                MyBorderButton(
                  buttonText: "Join",
                  onTap:
                      () => Get.offAndToNamed(
                        RouteName.onboardingHouseholdScreen,
                      ),
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
