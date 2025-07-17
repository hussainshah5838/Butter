

import 'package:butter/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:butter/constants/app_fonts.dart';
import 'package:butter/view/screens/auth/otp/otp.dart';
import 'package:butter/view/screens/auth/signup/signup.dart';
import 'package:butter/view/widget/common_image_view_widget.dart';
import 'package:butter/view/widget/custom_animated_row.dart';
import 'package:butter/view/widget/my_button.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:butter/view/widget/my_textfeild.dart';

import '../../../../constants/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../widget/custom_appbar.dart';
import '../../../widget/custom_checkbox_widget.dart';
import '../../bottom_nav_bar/bottom_nav_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_focusNodeEmail.hasFocus || _focusNodePassword.hasFocus) {
          _focusNodeEmail.unfocus();
          _focusNodePassword.unfocus();
        }
      },
      child: Scaffold(
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
                    text: "login".tr,
                    size: 20,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: 8,),
                  MyText(
                      text: "log_in_continue".tr,
                      size: 14,
                      weight: FontWeight.w500,
                      color: kTertiaryColor,
                  ),
                  SizedBox(height: 25,),
                  MyTextField(
                    focusNode: _focusNodeEmail,
                    label: "email_address".tr,
                    hint: "joseph@learnsketch.com",
                  ),
                  MyTextField(
                    focusNode: _focusNodePassword,
                    label: "password".tr,
                    hint: "********",
                    marginBottom: 6,
                    suffix: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Icon(Icons.remove_red_eye_outlined,color: kTertiaryColor,),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: MyText(
                      onTap: (){
                        Get.to(()=> OtpScreen());
                      },
                      text: "forgot_password".tr,
                      size: 12,
                      weight: FontWeight.w600,
                      color: kYellowColor,
                    ),
                  ),
                  SizedBox(height: 20,),
                  RichTermCheckBox(
                    onChanged: (bool ) {},
                  ),
                  SizedBox(height: 50,),
                  MyButton(onTap: (){
                    Get.to(()=> BottomNavBar());
                  }, buttonText: "login".tr),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      Get.to(()=> SignUpScreen());
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'dont_have_account'.tr,
                              style: TextStyle(
                                color: kTertiaryColor,
                                fontSize: 12,
                                fontFamily: AppFonts.inter,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: 'sign_up'.tr,
                              style: TextStyle(
                                  color: kYellowColor,
                                  fontSize: 12,
                                  fontFamily: AppFonts.inter,
                                  fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  AnimatedRow(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Expanded(
                       child: Divider(
                         color: kQuaternaryColor,
                       ),
                     ),

                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                       child: MyText(
                         text: "or_continue_with".tr,
                         size: 12,
                         weight: FontWeight.w400,
                         color: kTertiaryColor,
                       ),
                     ),
                     Expanded(
                       child: Divider(
                         color: kQuaternaryColor,
                       ),
                     ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  MyBorderButton(
                      buttonText: "", 
                      onTap: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonImageView(
                          //imagePath: Assets.imagesGoogle,
                          height: 24,
                        ),
                        SizedBox(width: 10,),
                        MyText(
                          text: "sign_in_google".tr,
                          size: 16,
                          weight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
