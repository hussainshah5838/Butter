import 'package:butter/config/constants/app_fonts.dart';
import 'package:butter/config/constants/app_sizes.dart';
import 'package:butter/config/routes/routes.dart';
import 'package:butter/view/widget/my_button.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/routes/routes_name.dart';

class OnboardingNameScreen extends StatelessWidget {
  OnboardingNameScreen({super.key});
  final RxString name = ''.obs;

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
                  text: "What should we call you?",
                  size: 32.sp,
                  weight: FontWeight.w500,
                  fontFamily: AppFonts.lexend,
                  letterSpacing: -1.60,
                ),
                20.verticalSpace,
                MyText(
                  text: "So we know who to blame when the fridge is empty.",
                  color: Colors.black.withValues(alpha: 0.50),
                  size: 16.sp,
                  weight: FontWeight.w300,
                ),
                35.verticalSpace,
                TextField(
                  onChanged: (value) => name.value = value,
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFonts.lexend,
                  ),
                  cursorColor: kYellowColor,
                  cursorHeight: 35.h,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Name",
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
                Obx(
                  () => MyBorderButton(
                    buttonText: "Looks good",
                    onTap:
                        name.value.isNotEmpty
                            ? () =>
                                Get.toNamed(RouteName.onboardingHouseholdScreen)
                            : () {},
                    height: 50.h,
                    backgroundColor: name.value.isNotEmpty
                        ? kYellowColor
                        : Colors.transparent,
                    borderColor:
                        name.value.isNotEmpty
                            ? kYellowColor
                            : Colors.black.withOpacity(0.25),
                    textColor:
                        name.value.isNotEmpty
                            ? kBlackColor
                            : Colors.black.withOpacity(0.25),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
