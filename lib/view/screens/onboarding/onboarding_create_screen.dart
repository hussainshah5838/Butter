import 'package:butter/config/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_fonts.dart';
import '../../../config/constants/app_sizes.dart';
import '../../widget/my_button.dart';
import '../../widget/my_text_widget.dart';

class OnboardingCreateScreen extends StatelessWidget {
   OnboardingCreateScreen({super.key});
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
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(Icons.arrow_back),
                ),
                50.verticalSpace,
                MyText(
                  text: "Let’s give your household a name",
                  size: 32.sp,
                  weight: FontWeight.w500,
                  fontFamily: AppFonts.lexend,
                  letterSpacing: -1.60,
                ),
                15.verticalSpace,
                MyText(
                  text: "Make it cute. Or threatening. \nYour call.",
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
                    hintText: "e.g. Smooth Operators",
                    hintStyle: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.lexend,
                      color: Colors.black.withValues(alpha: 0.20),
                      letterSpacing: -1.60,
                    ),
                  ),
                ),
                Spacer(),
                Spacer(),
                Obx(()=>MyBorderButton(
                  buttonText: "Looks good",
                  onTap:name.value.isNotEmpty
                      ?  () => Get.toNamed(RouteName.onboardingSuccessScreen)
                      :  (){},
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
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
