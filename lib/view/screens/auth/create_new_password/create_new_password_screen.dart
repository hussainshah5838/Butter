import 'package:butter/view/screens/auth/create_new_password/password_updated_screen.dart';
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
import '../../../widget/my_textfeild.dart';
import '../otp/incorrect_otp_screen.dart';


class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
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
                    text: "create_new_password".tr,
                    size: 20,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: 8,),
                  MyText(
                    text: "Choose_strong_password".tr,
                    size: 14,
                    weight: FontWeight.w500,
                    color: kTertiaryColor,
                  ),
                  SizedBox(height: 25,),

                  MyTextField(
                    focusNode: _focusNodePassword,
                    label: "create_password".tr,
                    hint: "********",
                    suffix: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Icon(Icons.remove_red_eye_outlined,color: kTertiaryColor,),
                    ),
                  ),
                  MyTextField(
                    focusNode: _focusNodePassword,
                    label: "retype_password".tr,
                    hint: "********",
                    suffix: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Icon(Icons.remove_red_eye_outlined,color: kTertiaryColor,),
                    ),
                  ),
                  SizedBox(height: 50,),
                  MyButton(onTap: (){
                    Get.to(()=>PasswordUpdatedScreen());
                  }, buttonText: "continue".tr),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
