
import 'package:butter/view/widget/common_image_view_widget.dart';
import 'package:butter/view/widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../../../generated/assets.dart';
import '../../widget/my_text_widget.dart';

class DialogHelper {
  static void addDeleteDialog(BuildContext context) {
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: AppSizes.DEFAULT,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonImageView(
                  //imagePath: Assets.imagesDeleteDialog,
                  height: 90,
                ),
                SizedBox(height: 24,),
                MyText(
                  text: "are_you_sure".tr,
                  size: 20,
                  weight: FontWeight.w700,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                MyText(
                  text: "sure_delete_account".tr,
                  size: 14,
                  color: kTertiaryColor,
                  paddingBottom: 16,
                  weight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                MyButton(onTap: (){}, buttonText: "yes_delete".tr),
                const SizedBox(height: 10),
                MyBorderButton(onTap: (){}, buttonText: "not_now".tr),

              ],
            ),
          ),
        ],
      ),
    );
  }


  static void logoutDialog(BuildContext context) {
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: AppSizes.DEFAULT,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonImageView(
                  //imagePath: Assets.imagesLogout,
                  height: 90,
                ),
                SizedBox(height: 24,),
                MyText(
                  text: "logging_out".tr,
                  size: 20,
                  weight: FontWeight.w700,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                MyText(
                  text: "are_you_sure_logout".tr,
                  size: 14,
                  color: kTertiaryColor,
                  paddingBottom: 16,
                  weight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                MyButton(onTap: (){}, buttonText: "logout".tr),
                const SizedBox(height: 10),
                MyBorderButton(onTap: (){}, buttonText: "not_now".tr),

              ],
            ),
          ),
        ],
      ),
    );
  }


}

