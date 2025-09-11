import 'package:butter/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_fonts.dart';
import '../../../config/constants/app_sizes.dart';
import '../../widget/my_button.dart';
import '../dialogs/dialogs.dart';



class AddCategoryBottomSheet{
  static void addCategorySheet(BuildContext context) {
    final RxString inputText = "".obs;
    Get.bottomSheet(
      ignoreSafeArea: true,
      isScrollControlled: true,
      StatefulBuilder(
        builder: (context, setState) {
          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: AppSizes.DEFAULT,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: Icon(Icons.close)),
                     Obx(
                           ()=> GestureDetector(
                             onTap: (){
                               Get.back();
                             },
                             child: MyText(
                                                    text: "Add",
                                                    size: 14,
                                                    weight: FontWeight.w600,
                                                    color: inputText.value.trim().isEmpty ? kTertiaryColor : kBlackColor,
                                                  ),
                           ),),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextField(
                    onChanged: (val) => inputText.value = val,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.lexend,
                    ),
                    cursorColor: kYellowColor,
                    cursorHeight: 35,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add Category",
                      hintStyle: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppFonts.lexend,
                        color: Colors.black.withValues(alpha: 0.20),
                      ),
                    ),
                  ),
                  SizedBox(height: 120),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  static void editHouseHoldSheet(BuildContext context) {
    final RxString inputText = "".obs;
    Get.bottomSheet(
      ignoreSafeArea: true,
      isScrollControlled: true,
      StatefulBuilder(
        builder: (context, setState) {
          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: AppSizes.DEFAULT,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: Icon(Icons.close)),
                     Obx(
                           ()=> GestureDetector(
                             onTap: (){
                               Get.back();
                             },
                             child: MyText(
                                                    text: "Save",
                                                    size: 14,
                                                    weight: FontWeight.w600,
                                                    color: inputText.value.trim().isEmpty ? kTertiaryColor : kBlackColor,
                                                  ),
                           ),),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextField(
                    onChanged: (val) => inputText.value = val,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.lexend,
                    ),
                    cursorColor: kYellowColor,
                    cursorHeight: 35,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Smooth Operators",
                      hintStyle: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppFonts.lexend,
                        color: Colors.black.withValues(alpha: 0.20),
                      ),
                    ),
                  ),
                  SizedBox(height: 120),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
