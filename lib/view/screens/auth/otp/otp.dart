import 'package:butter/view/screens/auth/create_new_password/create_new_password_screen.dart';
import 'package:butter/view/screens/auth/otp/incorrect_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pinput/pinput.dart';
import 'package:butter/view/screens/auth/login/login.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_fonts.dart';
import '../../../../config/constants/app_sizes.dart';
import '../../../../generated/assets.dart';
import '../../../widget/common_image_view_widget.dart';
import '../../../widget/custom_animated_row.dart';
import '../../../widget/custom_appbar.dart';
import '../../../widget/my_button.dart';
import '../../../widget/my_text_widget.dart';
import '../../../widget/my_textfeild.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ""),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(
            onTap: () {
              Get.to(() => CreateNewPasswordScreen());
            },
            buttonText: "continue".tr,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
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
                text: "verify_phone_number".tr,
                size: 20,
                weight: FontWeight.w600,
              ),
              SizedBox(height: 8),
              MyText(
                text: "enter_code".tr,
                size: 14,
                weight: FontWeight.w500,
                color: kTertiaryColor,
              ),
              SizedBox(height: 26),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "8459324012 ".tr,
                      style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: 16,
                        fontFamily: AppFonts.inter,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: 'change'.tr,
                      style: TextStyle(
                        color: kYellowColor,
                        fontSize: 14,
                        fontFamily: AppFonts.inter,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 16),
              AnimatedRow(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Pinput(
                    length: 4,
                    defaultPinTheme: PinTheme(
                      width: 48,
                      height: 56,
                      textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFonts.inter,
                        color: kSecondaryColor,
                      ),
                      decoration: BoxDecoration(
                        color: kPrimaryColor, // Center color
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: kYellowColor, width: 1),
                      ),
                      //margin: EdgeInsets.only(left: 8),
                    ),
                    focusedPinTheme: PinTheme(
                      width: 48,
                      height: 56,
                      textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFonts.inter,
                        color: kSecondaryColor,
                      ),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: kYellowColor, width: 1),
                      ),
                      // margin: EdgeInsets.only(left: 8),
                    ),
                    submittedPinTheme: PinTheme(
                      width: 48,
                      height: 56,
                      textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: kSecondaryColor,
                      ),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: kYellowColor, width: 1),
                      ),
                      // margin: EdgeInsets.only(left: 8),
                    ),
                    onLongPress: () {
                      Get.to(() => IncorrectOtpScreen());
                    },
                    onCompleted: (pin) {
                      //Get.to(()=>CreateNewPasswordScreen());
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "didn't_receive_the_code".tr,
                      style: TextStyle(
                        color: kTXGColor,
                        fontSize: 12,
                        fontFamily: AppFonts.inter,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: 'resend'.tr,
                      style: TextStyle(
                        color: kYellowColor,
                        fontSize: 12,
                        fontFamily: AppFonts.inter,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
