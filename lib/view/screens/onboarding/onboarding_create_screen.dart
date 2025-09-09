import 'package:butter/view/screens/onboarding/onboarding_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';
import '../../../constants/app_sizes.dart';
import '../../widget/my_button.dart';
import '../../widget/my_text_widget.dart';


class OnboardingCreateScreen extends StatelessWidget {
  const OnboardingCreateScreen({super.key});

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
            padding: AppSizes.DEFAULT,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back)),
                SizedBox(height: 50,),
                MyText(
                  text: "Let’s give your household a name",
                  size: 32,
                  weight: FontWeight.w500,
                  fontFamily: AppFonts.lexend,
                  letterSpacing: -1.60,
                ),
                SizedBox(height: 15,),
                MyText(
                  text: "Make it cute. Or threatening. \nYour call.",
                  color: Colors.black.withValues(alpha: 0.50),
                  size: 16,
                  weight: FontWeight.w300,
                ),
                SizedBox(height: 35,),
                TextField(
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFonts.lexend,
                  ),
                  cursorColor: kYellowColor,
                  cursorHeight: 35,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "e.g. Smooth Operators",
                    hintStyle: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.lexend,
                      color: Colors.black.withValues(alpha: 0.20),
                      letterSpacing: -1.60,

                    ),
                  ),
                ),
                Spacer(),
                Spacer(),
                MyBorderButton(buttonText: "Looks good", onTap: (){
                  Get.to(()=>OnboardingSuccessScreen());
                })

              ],
            ),
          ),
        ),
      ),
    );
  }
}
