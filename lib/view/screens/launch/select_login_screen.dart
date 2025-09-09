import 'package:butter/constants/app_fonts.dart';
import 'package:butter/constants/app_sizes.dart';
import 'package:butter/view/screens/onboarding/onboarding_name_screen.dart';
import 'package:butter/view/widget/common_image_view_widget.dart';
import 'package:butter/view/widget/my_button.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/app_colors.dart';
import '../../../generated/assets.dart';



class SelectLoginScreen extends StatelessWidget {
  const SelectLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              MyText(
                text: "butter",
                size: 80,
                weight: FontWeight.w400,
                color: kYellowColor,
                fontFamily: AppFonts.caprasimo,
              ),
              SizedBox(height: 20,),
              MyText(
                text: "The smoothest way to share \nand shop your groceries",
                size: 16,
                weight: FontWeight.w300,
                color: kBlackColor,
                textAlign: TextAlign.center,
              ),
              Spacer(),
              CustomButton(
                  onTap: (){},
                  buttonText: "",
                customChild: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonImageView(
                      svgPath: Assets.svgApple,
                    ),
                    SizedBox(width: 10,),
                    MyText(
                      text: "Continue with Apple",
                      size: 16,
                      weight: FontWeight.w600,
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              CustomButton(
                onTap: (){
                  Get.to(()=>OnboardingNameScreen());
                },
                buttonText: "",
                customChild: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonImageView(
                      svgPath: Assets.svgGoogle,
                    ),
                    SizedBox(width: 10,),
                    MyText(
                      text: "Continue with Google",
                      size: 16,
                      weight: FontWeight.w600,
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'By continuing, you agree to Butter’s\n',
                      style: TextStyle(
                        color: Colors.black.withValues(alpha: 0.50),
                        fontSize: 12,
                        fontFamily: AppFonts.inter,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(
                        color: Colors.black.withValues(alpha: 0.50),
                        fontSize: 12,
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
    );
  }
}
