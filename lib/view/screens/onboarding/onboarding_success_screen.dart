import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/app_fonts.dart';
import '../../../constants/app_sizes.dart';
import '../../widget/my_button.dart';
import '../../widget/my_text_widget.dart';
import 'add_tap_and_speak_screen.dart';
import 'add_voice_confirm_screen.dart';



class OnboardingSuccessScreen extends StatelessWidget {
  const OnboardingSuccessScreen({super.key});

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

                Spacer(),
                MyText(
                  text: "All set,\nSmooth Operators 👌 ",
                  size: 32,
                  weight: FontWeight.w500,
                  fontFamily: AppFonts.lexend,
                  letterSpacing: -1.60,
                ),
                SizedBox(height: 15,),
                MyText(
                  text: "Time to add a few essentials. \nOr some chaos. Up to you.",
                  color: Colors.black.withValues(alpha: 0.50),
                  size: 16,
                  weight: FontWeight.w300,
                ),
                Spacer(),
                Spacer(),
                MyButton(buttonText: "Let’s do it", onTap: (){
                  Get.to(()=>AddTapAndSpeakScreen());
                }),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
