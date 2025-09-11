import 'package:butter/view/widget/common_image_view_widget.dart';
import 'package:butter/view/widget/my_button.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../generated/assets.dart';
import '../categories_screen/add_category_bottom_sheet.dart';
import '../dialogs/dialogs.dart';

class HouseHoldScreen extends StatelessWidget {
  const HouseHoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    MyText(
                      text: "Household",
                      size: 12,
                      weight: FontWeight.w300,
                      color: Colors.black.withValues(alpha: 0.50),
                    ),
                    SizedBox(height: 10.h),
                    MyText(
                      text: "Smooth Operators",
                      size: 32,
                      weight: FontWeight.w600,
                    ),
                    SizedBox(height: 10.h),
                    buildProfileRow(
                      imagePath: Assets.imagesPpf,
                      text: "You",
                    ),
                    Divider(),
                    buildProfileRow(
                      imagePath: Assets.imagesPpf,
                      text: "Robert",
                    ),

                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
              child: MyButton(onTap: (){}, buttonText: "Invite"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Icon(Icons.arrow_back, size: 24.sp, color: Colors.black87),
            ),
            PopupMenuButton<int>(
               clipBehavior: Clip.none,
              padding: EdgeInsets.zero, // removes inner padding
              constraints: BoxConstraints(), // removes min size constraints
              offset: const Offset(0, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              icon: Icon(
                Icons.more_horiz_outlined,
                size: 24,
                color: Colors.black87,
              ),
              onSelected: (value) {
                if (value == 1) {
                  AddCategoryBottomSheet.editHouseHoldSheet(context);
                } else if (value == 2) {
                  DialogHelper.leaveHouseHoldDialog(context);
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 1,
                  child: Text("Edit name"),
                ),
                const PopupMenuItem(
                  value: 2,
                  child: Text("Leave household"),
                ),
              ],
            )


          ],
        ),
      ),
    );
  }

  Widget buildProfileRow({
    required String imagePath,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          CommonImageView(
            imagePath: imagePath,
            height: 35,
          ),
          SizedBox(width: 12.w),
          MyText(
            text: text,
            size: 14,
            weight: FontWeight.w600,
          ),
        ],
      ),
    );
  }

}
