import 'package:butter/constants/app_fonts.dart';
import 'package:butter/constants/app_sizes.dart';
import 'package:butter/view/widget/my_button.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:butter/view/widget/my_textfeild.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';



class OnboardingNameScreen extends StatelessWidget {
  const OnboardingNameScreen({super.key});

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
                  text: "What should we call you?",
                  size: 32,
                  weight: FontWeight.w500,
                  fontFamily: AppFonts.lexend,
                  letterSpacing: -1.60,
                ),
                SizedBox(height: 15,),
                MyText(
                  text: "So we know who to blame when the fridge is empty.",
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
                    hintText: "Name",
                    hintStyle: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.lexend,
                      color: Colors.black.withValues(alpha: 0.20),

                    ),
                  ),
                ),
                Spacer(),
                Spacer(),
                MyBorderButton(buttonText: "Looks good", onTap: (){})

              ],
            ),
          ),
        ),
      ),
    );
  }
}
