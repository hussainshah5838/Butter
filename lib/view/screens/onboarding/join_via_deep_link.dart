import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../config/constants/app_fonts.dart';
import '../../../config/routes/routes_name.dart';
import '../../widget/my_button.dart';
import '../../widget/my_text_widget.dart';
import 'add_tap_and_speak_screen.dart';



class JoinViaDeepLink extends StatelessWidget {
  const JoinViaDeepLink({super.key});

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
                  text: "Join Robert’s\nhousehold 🤝 ",
                  size: 32.sp,
                  weight: FontWeight.w500,
                  fontFamily: AppFonts.lexend,
                  letterSpacing: -1.60,
                ),
                15.verticalSpace,
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'It’s been named ',
                        style: TextStyle(
                          color: Colors.black.withValues(alpha: 0.50),
                          fontSize: 16,
                          fontFamily: AppFonts.inter,
                          fontWeight: FontWeight.w300,
                          height: 1.50,
                        ),
                      ),
                      TextSpan(
                        text: 'Smooth Operators',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: AppFonts.inter,
                          fontWeight: FontWeight.w600,
                          height: 1.50,
                        ),
                      ),
                      TextSpan(
                        text: ', whether you like it or not.\n\nYou can’t control the name, but you can control what gets added to the list.',
                        style: TextStyle(
                          color: Colors.black.withValues(alpha: 0.50),
                          fontSize: 16,
                          fontFamily: AppFonts.inter,
                          fontWeight: FontWeight.w300,
                          height: 1.50,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Spacer(),
                MyButton(
                  buttonText: "Join household",
                   onTap: () => Get.toNamed(RouteName.onboardingSuccessScreen),
                  height: 50.h,
                ),
                20.verticalSpace,
                GestureDetector(
                    onTap: () => Get.toNamed(RouteName.onboardingCreateScreen),
                    child: Align(
                      alignment: Alignment.center,
                        child: MyText(text: "Start my own"))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
