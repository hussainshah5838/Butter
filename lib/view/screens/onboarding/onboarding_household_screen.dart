import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';
import '../../../constants/app_sizes.dart';
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
            padding: AppSizes.DEFAULT,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                    child: Icon(Icons.arrow_back)),
                Spacer(),
                MyText(
                  text: "Nice to meet you,\nRobert ✨",
                  size: 32,
                  weight: FontWeight.w500,
                  fontFamily: AppFonts.lexend,
                  letterSpacing: -1.60,
                ),
                SizedBox(height: 15,),
                MyText(
                  text: "Are we joining an existing household, \nor starting your own?",
                  color: Colors.black.withValues(alpha: 0.50),
                  size: 16,
                  weight: FontWeight.w300,
                ),
                Spacer(),
                Spacer(),
                MyButton(buttonText: "Join a household", onTap: (){}),
                SizedBox(height: 10,),
                MyButton(buttonText: "Start my own", onTap: (){}),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
