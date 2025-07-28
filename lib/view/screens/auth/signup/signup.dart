import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:butter/config/constants/app_sizes.dart';
import 'package:butter/view/screens/auth/login/login.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_fonts.dart';
import '../../../../generated/assets.dart';
import '../../../widget/common_image_view_widget.dart';
import '../../../widget/custom_animated_row.dart';
import '../../../widget/custom_appbar.dart';
import '../../../widget/custom_checkbox_widget.dart';
import '../../../widget/custom_dropdown.dart';
import '../../../widget/my_button.dart';
import '../../../widget/my_text_widget.dart';
import '../../../widget/my_textfeild.dart';
import '../../bottom_nav_bar/bottom_nav_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String selectedValue = 'Select Option'; // Initial selected value
  List<String> items = ['Option 1', 'Option 2', 'Option 3'];
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  final FocusNode _focusNodeConfirmPassword = FocusNode();
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
        appBar: CustomAppBar(title: ""),
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
                  SizedBox(height: 36),
                  MyText(text: "sign_up".tr, size: 20, weight: FontWeight.w600),
                  SizedBox(height: 8),
                  MyText(
                    text: "create_account_continue".tr,
                    size: 14,
                    weight: FontWeight.w500,
                    color: kTertiaryColor,
                  ),
                  SizedBox(height: 25),
                  MyTextField(
                    focusNode: _focusNodeEmail,
                    label: "first_name".tr,
                    hint: "Joseph",
                  ),
                  MyTextField(
                    focusNode: _focusNodeEmail,
                    label: "last_name".tr,
                    hint: "Martini",
                  ),
                  MyTextField(
                    focusNode: _focusNodeEmail,
                    label: "email_address".tr,
                    hint: "joseph@learnsketch.com",
                  ),
                  MyTextField(
                    focusNode: _focusNodeEmail,
                    label: "license_plate".tr,
                    hint: "ABC2324",
                  ),
                  MyTextField(
                    hint: "576 889 324",
                    label: "phone_number".tr,
                    //showFlag:true,
                    prefix: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MyText(
                            text: "+44",
                            size: 14,
                            color: kGreyColor,
                            weight: FontWeight.w500,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: kTertiaryColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5.0,
                            ),
                            child: Container(
                              width: 1.5,
                              height: 25,
                              decoration: BoxDecoration(
                                color: kDividerColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  MyTextField(
                    focusNode: _focusNodePassword,
                    label: "create_password".tr,
                    hint: "********",
                    suffix: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Icon(
                        Icons.remove_red_eye_outlined,
                        color: kTertiaryColor,
                      ),
                    ),
                  ),
                  MyTextField(
                    focusNode: _focusNodePassword,
                    label: "retype_password".tr,
                    hint: "********",

                    suffix: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Icon(
                        Icons.remove_red_eye_outlined,
                        color: kTertiaryColor,
                      ),
                    ),
                  ),
                  CustomDropDown(
                    labelText: 'hOW_dID_yOU_hEAR_aBOUT_uS'.tr,
                    hint: 'Select Option',
                    items: items,
                    selectedValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    marginBottom: 20,
                    //bgColor: Colors.white, // optional
                    width: double.infinity, // optional
                  ),

                  SizedBox(height: 20),
                  RichTermCheckBox(onChanged: (bool) {}),
                  SizedBox(height: 50),
                  MyButton(
                    onTap: () {
                      Get.to(() => BottomNavBar());
                    },
                    buttonText: "sign_up".tr,
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SignUpScreen());
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => LoginScreen());
                        },
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'already_have_an_account'.tr,
                                style: TextStyle(
                                  color: kTertiaryColor,
                                  fontSize: 12,
                                  fontFamily: AppFonts.inter,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'login'.tr,
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
                  ),
                  SizedBox(height: 20),
                  AnimatedRow(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Divider(color: kQuaternaryColor)),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: MyText(
                          text: "or_continue_with".tr,
                          size: 12,
                          weight: FontWeight.w400,
                          color: kTertiaryColor,
                        ),
                      ),
                      Expanded(child: Divider(color: kQuaternaryColor)),
                    ],
                  ),
                  SizedBox(height: 20),
                  MyBorderButton(
                    buttonText: "",
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonImageView(
                          //imagePath: Assets.imagesGoogle,
                          height: 24,
                        ),
                        SizedBox(width: 10),
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
