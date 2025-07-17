import 'package:butter/view/screens/auth/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../generated/assets.dart';
import '../../../widget/common_image_view_widget.dart';
import '../../../widget/custom_appbar.dart';
import '../../../widget/my_button.dart';
import '../../../widget/my_text_widget.dart';

class PasswordUpdatedScreen extends StatefulWidget {
  const PasswordUpdatedScreen({super.key});

  @override
  State<PasswordUpdatedScreen> createState() => _PasswordUpdatedScreenState();
}

class _PasswordUpdatedScreenState extends State<PasswordUpdatedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppSizes.DEFAULT,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CommonImageView(
                    //imagePath: Assets.imagesLogo,
                    height: 92,
                  ),
                ),
                SizedBox(height: 36,),
                MyText(
                  text: "password_updated".tr,
                  size: 20,
                  weight: FontWeight.w600,
                ),
                SizedBox(height: 8,),
                MyText(
                  text: "password_changed".tr,
                  size: 14,
                  weight: FontWeight.w500,
                  color: kTertiaryColor,
                ),
                SizedBox(height: 50,),
                MyButton(onTap: (){
                  Get.to(()=>LoginScreen());
                }, buttonText: "back_to_login".tr),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
