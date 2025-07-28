import 'package:butter/config/constants/app_fonts.dart';
import 'package:butter/config/constants/app_sizes.dart';
import 'package:butter/config/routes/routes_name.dart';
import 'package:butter/view/widget/common_image_view_widget.dart';
import 'package:butter/view/widget/my_button.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../config/constants/app_colors.dart';
import '../../../generated/assets.dart';

class SelectLoginScreen extends StatelessWidget {
  const SelectLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(RouteName.onboardingNameScreen),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  "butter",
                  style: GoogleFonts.caprasimo(
                    fontSize: 80.sp,
                    fontWeight: FontWeight.w400,
                    color: kYellowColor,
                    height: 1.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                10.verticalSpace,
                Text(
                  "The smoothest way to share \nand shop your groceries",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: kBlackColor,
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                CustomButton(
                  onTap: () {},
                  buttonText: "",
                  customChild: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonImageView(svgPath: Assets.svgApple),
                      10.horizontalSpace,
                      MyText(
                        text: "Continue with Apple",
                        size: 16.sp,
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                10.verticalSpace,
                CustomButton(
                  onTap: () {},
                  buttonText: "",
                  customChild: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonImageView(svgPath: Assets.svgGoogle),
                      10.horizontalSpace,
                      MyText(
                        text: "Continue with Google",
                        size: 16.sp,
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                20.verticalSpace,
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'By continuing, you agree to Butter’s\n',
                        style: TextStyle(
                          color: Colors.black.withValues(alpha: 0.50),
                          fontSize: 12.sp,
                          fontFamily: AppFonts.inter,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Terms of Service',
                        style: TextStyle(
                          color: Colors.black.withValues(alpha: 0.50),
                          fontSize: 12.sp,
                          fontFamily: AppFonts.inter,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(
                          color: Colors.black.withValues(alpha: 0.50),
                          fontSize: 12,
                          fontFamily: AppFonts.inter,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          color: Colors.black.withValues(alpha: 0.50),
                          fontSize: 12,
                          fontFamily: AppFonts.inter,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text: '.',
                        style: TextStyle(
                          color: Colors.black.withValues(alpha: 0.50),
                          fontSize: 12,
                          fontFamily: AppFonts.inter,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
