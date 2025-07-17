import 'package:butter/constants/app_fonts.dart';
import 'package:butter/view/widget/my_button.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';



class AddVoiceConfirmScreen extends StatelessWidget {
  const AddVoiceConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
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
                SizedBox(height: 30,),
                MyText(
                  text: "Confirm items",
                  size: 32,
                  weight: FontWeight.w500,
                  letterSpacing: -1.60,
                  fontFamily: AppFonts.lexend,
                ),
                MyText(
                  text: "Tap to edit. Swipe left to delete.",
                  size: 14,
                  color: Colors.black.withValues(alpha: 0.50),
                  weight: FontWeight.w300,
                ),
                SizedBox(height: 40,),


                buildProductTile(
                  title: "Bananas",
                ),
                Divider(),
                buildProductTile(
                  title: "Carrots",
                  trailingText: "1",
                ),
                Divider(),
                buildProductTile(
                  title: "Cherry toms",
                ),
                Divider(),
                buildProductTile(
                  title: "Olive oil",
                ),
                Divider(),
                buildProductTile(
                  title: "Spinach",
                  subtitle: 'The prewashed ones with the purple label',
                  trailingText: "2"
                ),
                Divider(),

                Spacer(),
                MyButton(onTap: (){}, buttonText: "Looks good"),
                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.center,
                  child: MyText(
                    text: "Cancel",
                    size: 14,
                    weight: FontWeight.w300,
                  ),
                )



              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildProductTile({
    required String title,
    String? subtitle,
    String? trailingText,
  }) {
    return ListTile(
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,
      title: MyText(
        text: title,
        size: 16,
        color: kBlackColor,
        weight: FontWeight.w600,
      ),
      subtitle: subtitle != null
          ? MyText(
        text: subtitle,
        size: 10,
        weight: FontWeight.w300,
        color: Colors.black.withOpacity(0.5),
      )
          : null,
      trailing: trailingText != null
          ? MyText(
        text: trailingText,
        size: 10,
        color: kBlackColor,
        weight: FontWeight.w600,
      )
          : null,
    );
  }

}
