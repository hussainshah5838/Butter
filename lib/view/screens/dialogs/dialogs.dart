import 'package:butter/view/widget/common_image_view_widget.dart';
import 'package:butter/view/widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_sizes.dart';
import '../../../generated/assets.dart';
import '../../widget/my_text_widget.dart';

class DialogHelper {
  static void undoShoppingDialog(BuildContext context) {
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
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyText(
                  text: "Are you sure?",
                  size: 20,
                  weight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                MyText(
                  text: 'Doing so will add these items back to your list.',
                  size: 14,
                  color: kTertiaryColor,
                  paddingBottom: 16,
                  weight: FontWeight.w300,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                MyButton(
                  onTap: () {},
                  buttonText: "Yes, undo shopping",
                  backgroundColor: kRedColor,
                  fontColor: kPrimaryColor,
                ),
                const SizedBox(height: 10),
                MyText(
                  text: "No, keep as-is",
                  size: 14,
                  weight: FontWeight.w300,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static void deleteCategoryDialog(BuildContext context) {
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
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyText(
                  text: "Are you sure?",
                  size: 20,
                  weight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                MyText(
                  text:
                      'The category will be deleted for the entire household.',
                  size: 14,
                  color: kTertiaryColor,
                  paddingBottom: 16,
                  weight: FontWeight.w300,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                MyButton(
                  onTap: () {},
                  buttonText: "Yes, delete it",
                  backgroundColor: kRedColor,
                  fontColor: kPrimaryColor,
                ),
                const SizedBox(height: 10),
                MyText(text: "No, keep it", size: 14, weight: FontWeight.w300),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static void deleteAccountDialog(BuildContext context) {
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
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyText(
                  text: "Are you sure?",
                  size: 20,
                  weight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                MyText(
                  text:
                      'You’ll be removed from your household, and your personal settings will be lost. Shared lists will remain available to other members.',
                  size: 14,
                  color: kTertiaryColor,
                  paddingBottom: 16,
                  weight: FontWeight.w300,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                MyButton(
                  onTap: () {},
                  buttonText: "Delete my account",
                  backgroundColor: kRedColor,
                  fontColor: kPrimaryColor,
                ),
                const SizedBox(height: 10),
                MyText(text: "Cancel", size: 14, weight: FontWeight.w300),
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
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonImageView(
                  //imagePath: Assets.imagesLogout,
                  height: 90,
                ),
                SizedBox(height: 24),
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
                MyButton(onTap: () {}, buttonText: "logout".tr),
                const SizedBox(height: 10),
                MyBorderButton(onTap: () {}, buttonText: "not_now".tr),
              ],
            ),
          ),
        ],
      ),
    );
  }


  static void leaveHouseHoldDialog(BuildContext context) {
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
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyText(
                  text: "Are you sure?",
                  size: 20,
                  weight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                MyText(
                  text:
                  'You’ll no longer have access to the shared list and history.',
                  size: 14,
                  color: kTertiaryColor,
                  paddingBottom: 16,
                  weight: FontWeight.w300,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                MyButton(
                  onTap: () {},
                  buttonText: "Yes, leave",
                  backgroundColor: kRedColor,
                  fontColor: kPrimaryColor,
                ),
                const SizedBox(height: 10),
                MyText(text: "No, Stay", size: 14, weight: FontWeight.w300),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
