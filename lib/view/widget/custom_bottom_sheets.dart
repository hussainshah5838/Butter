import 'package:butter/constants/app_fonts.dart';
import 'package:butter/view/widget/common_image_view_widget.dart';
import 'package:butter/view/widget/my_button.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/app_colors.dart';
import '../../generated/assets.dart';

class BottomSheets {
  static void showLocationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
               MyText(
                 text: "Dirty Dog’s Car Wash Kennesaw",
                 size: 20,
                 weight: FontWeight.w400,
                 color: kSecondaryColor,
                 fontFamily: AppFonts.inter,
               ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: kBlueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(44),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyText(
                        text: "Directions",
                        size: 16,
                        weight: FontWeight.w500,
                        fontFamily: AppFonts.inter,
                      ),


                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static void showScanBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   SizedBox(width: 10,),
                   MyText(
                     text: "4 Alarm Graphene",
                     size: 20,
                     weight: FontWeight.w600,
                     color: kSecondaryColor,
                     fontFamily: AppFonts.inter,
                   ),
                   InkWell(
                     onTap: (){
                       Get.back();
                     },
                       child: Icon(Icons.close)),
                 ],
               ),
                SizedBox(
                  height: 36,
                ),
                CommonImageView(
                  //svgPath: Assets.svgScan,
                ),
                SizedBox(height: 8,),
                MyText(
                  text: "84790341",
                  size: 14,
                  weight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16,),
                MyText(
                  text: "Scan your code at any Dirty Dog’s location\n to redeem your 4 Alarm Graphene!",
                  size: 14,
                  weight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 45,),
                MyBorderButton(
                  borderColor: kSecondaryColor,
                    radius: 15,
                    onTap: (){
                    Get.back();
                    },
                    buttonText: "Cancel")

              ],
            ),
          ),
        );
      },
    );
  }

  static void showReferFriendBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,

      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "refer_a_friend".tr,
                  size: 20,
                  weight: FontWeight.w600,
                  color: kSecondaryColor,
                  fontFamily: AppFonts.inter,
                ),
                MyText(
                  text: "Lorem ipsum dolor sit amet,",
                  size: 14,
                  weight: FontWeight.w400,
                  color: kTHLCColor,
                  fontFamily: AppFonts.inter,
                ),

                SizedBox(height: 10,),
                SizedBox(
                  height: 85,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Column(
                          children: [
                            CommonImageView(
                              //imagePath: Assets.imagesFl,
                              height: 65,
                            ),
                            SizedBox(height: 3,),
                            MyText(
                              text: "First Last",
                              size: 11,
                              weight: FontWeight.w400,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        children: [
                          CommonImageView(
                            //imagePath: Assets.imagesAppName,
                            height: 50,
                          ),
                          SizedBox(height: 3,),
                          MyText(
                            text: "App Name",
                            size: 11,
                            weight: FontWeight.w400,
                          )
                        ],
                      ),
                    );
                  },
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                  decoration: ShapeDecoration(
                    color: kWhiteBgColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        text: "copy_link".tr,
                        size: 17,
                        weight: FontWeight.w600,
                      ),
                      CommonImageView(
                       // svgPath: Assets.svgCopy,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                  decoration: ShapeDecoration(
                    color: kWhiteBgColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            text: "add_to_reading_list".tr,
                            size: 17,
                            weight: FontWeight.w600,
                          ),
                          CommonImageView(
                            //svgPath: Assets.svgReadingList,
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            text: "add_bookmark".tr,
                            size: 17,
                            weight: FontWeight.w600,
                          ),
                          CommonImageView(
                            //svgPath: Assets.svgBookmark,
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            text: "add_to_favorites".tr,
                            size: 17,
                            weight: FontWeight.w600,
                          ),
                          CommonImageView(
                           // svgPath: Assets.svgStar,
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            text: "find_on_page".tr,
                            size: 17,
                            weight: FontWeight.w600,
                          ),
                          CommonImageView(
                           // svgPath: Assets.svgFind,
                          )
                        ],
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: MyText(
                    text: "edit_actions".tr,
                    size: 16,
                    weight: FontWeight.w600,
                    color: kYellowColor,
                  ),
                )

              ],
            ),
          ),
        );
      },
    );
  }




}
