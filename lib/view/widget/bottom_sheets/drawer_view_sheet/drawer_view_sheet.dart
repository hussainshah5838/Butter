import 'package:butter/config/constants/app_fonts.dart';
import 'package:butter/controller/list_controller.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../config/constants/app_colors.dart';
import '../../../../model/product.dart';
import '../../popup/popup.dart';

class DrawerViewSheet {
  static void show() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        margin: EdgeInsets.only(top: 0.1.sh),
        decoration: BoxDecoration(
          color: Color(0xFFFFF6D8),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Close button
            GestureDetector(
              onTap: () => Get.back(),
              child: Icon(Icons.close, color: Colors.grey[600], size: 24.sp),
            ),

            SizedBox(height: 30.h),

            // Header with item count
            MyText(
              text: "2 items",
              size: 32,
              weight: FontWeight.w700,
              color: kBlackColor,
              fontFamily: AppFonts.lexend,
            ),

            SizedBox(height: 30.h),

            // Shopping list content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Produce Section
                    _buildCategorySection("Produce", [
                      _buildShoppingItem("Carrots", 4, true),
                    ]),

                    SizedBox(height: 40.h),

                    // Pantry Section
                    _buildCategorySection("Pantry", [
                      _buildShoppingItem("Olive oil", null, true),
                    ]),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20.h),

            // Undo shopping button
            GestureDetector(
              onTap: () {
                CustomConfirmationPopup.show(
                  title: "Are you sure?",
                  description:
                      "Doing so will add these items back to your list.",
                  confirmButtonText: "Yes, undo shopping",
                  cancelButtonText: "No, keep as-is",
                  onConfirm: () => Get.back(),
                  onCancel: () => Get.back(),
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(25.r),
                  border: Border.all(color: Colors.grey.shade300, width: 1.5),
                ),
                child: Center(
                  child: MyText(
                    text: "Undo shopping",
                    size: 16,
                    weight: FontWeight.w500,
                    color: kRedColor,
                    fontFamily: AppFonts.lexend,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
    );
  }

  static Widget _buildCategorySection(String categoryName, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: categoryName,
          size: 18,
          weight: FontWeight.w600,
          color: Colors.grey.shade700,
          fontFamily: AppFonts.lexend,
        ),

        SizedBox(height: 16.h),

        ...items,
      ],
    );
  }

  static Widget _buildShoppingItem(
    String itemName,
    int? quantity,
    bool isCompleted,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          // Checkmark circle
          Container(
            width: 28.w,
            height: 28.h,
            decoration: BoxDecoration(
              color: Color(0xFFFFD54F), // Yellow checkmark background
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(Icons.check, color: Colors.white, size: 16.sp),
            ),
          ),

          SizedBox(width: 16.w),

          // Item name
          Expanded(
            child: MyText(
              text: itemName,
              size: 18,
              weight: FontWeight.w500,
              color: kBlackColor,
              fontFamily: AppFonts.lexend,
            ),
          ),

          // Quantity (if present)
          if (quantity != null)
            MyText(
              text: quantity.toString(),
              size: 16,
              weight: FontWeight.w500,
              color: Colors.grey.shade600,
              fontFamily: AppFonts.lexend,
            ),
        ],
      ),
    );
  }
}
