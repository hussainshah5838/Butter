import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_sizes.dart';
import '../../../../generated/assets.dart';
import '../../../widget/common_image_view_widget.dart';
import '../../../widget/custom_appbar.dart';
import '../../../widget/my_button.dart';
import '../../../widget/my_text_widget.dart';

class IncorrectOtpScreen extends StatelessWidget {
  const IncorrectOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ""),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppSizes.DEFAULT,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CommonImageView(
                    //imagePath: Assets.imagesLogo,
                    height: 92,
                  ),
                ),
                SizedBox(height: 36),
                MyText(
                  text: "code_incorrect".tr,
                  size: 20,
                  weight: FontWeight.w600,
                ),
                SizedBox(height: 8),
                MyText(
                  text: "code_incorrect_try_again".tr,
                  size: 14,
                  weight: FontWeight.w500,
                  color: kTertiaryColor,
                ),
                SizedBox(height: 50),
                MyBorderButton(
                  borderColor: kYellowColor,
                  textSize: 16,
                  weight: FontWeight.w600,
                  onTap: () {},
                  buttonText: "send_code_again".tr,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
