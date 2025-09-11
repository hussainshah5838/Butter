import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../config/constants/app_fonts.dart';
import '../../../config/routes/routes_name.dart';
import '../../widget/my_button.dart';
import '../../widget/my_text_widget.dart';



class OnboardingExistHouseHoldSuccessScreen extends StatelessWidget {
  const OnboardingExistHouseHoldSuccessScreen({super.key});

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
                  text: "You’re in 👊",
                  size: 32.sp,
                  weight: FontWeight.w500,
                  fontFamily: AppFonts.lexend,
                  letterSpacing: -1.60,
                ),
                15.verticalSpace,
                MyText(
                  text:
                  "Congrats. Now you can both pretend it\nwasn’t your turn to shop.",
                  color: Colors.black.withValues(alpha: 0.50),
                  size: 16.sp,
                  weight: FontWeight.w300,
                ),
                Spacer(),
                Spacer(),
                MyButton(
                  buttonText: "Show me the list",
                 onTap: () => Get.toNamed(RouteName.joinViaDeepLink),
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
