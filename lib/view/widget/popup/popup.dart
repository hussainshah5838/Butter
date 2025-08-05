import 'package:butter/config/constants/app_fonts.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../config/constants/app_colors.dart';

class CustomConfirmationPopup {
  static void show({
    required String title,
    required String description,
    required String confirmButtonText,
    required String cancelButtonText,
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
  }) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: kBlackColor.withAlpha(20),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              MyText(
                text: title,
                size: 24,
                weight: FontWeight.w600,
                color: kBlackColor,
                fontFamily: AppFonts.lexend,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 16.h),

              // Description
              MyText(
                text: description,
                size: 16,
                weight: FontWeight.w400,
                color: Colors.grey.shade600,
                fontFamily: AppFonts.lexend,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 32.h),

              // Confirm button
              GestureDetector(
                onTap: () {
                  onConfirm(); // Then execute the function
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  decoration: BoxDecoration(
                    color: Colors.red.shade500,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Center(
                    child: MyText(
                      text: confirmButtonText,
                      size: 16,
                      weight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: AppFonts.lexend,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16.h),

              // Cancel button
              GestureDetector(
                onTap: onCancel ?? () => Get.back(),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Center(
                    child: MyText(
                      text: cancelButtonText,
                      size: 16,
                      weight: FontWeight.w500,
                      color: kBlackColor,
                      fontFamily: AppFonts.lexend,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }

  // Pre-configured method for undo shopping confirmation
  static void showUndoShoppingConfirmation({required VoidCallback onConfirm}) {
    show(
      title: "Are you sure?",
      description: "Doing so will add these items back to your list.",
      confirmButtonText: "Yes, undo shopping",
      cancelButtonText: "No, keep as-is",
      onConfirm: onConfirm,
      onCancel: () => Get.back(),
    );
  }

  // Generic confirmation popup
  static void showConfirmation({
    required String title,
    required String description,
    required String confirmText,
    String cancelText = "Cancel",
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
    Color confirmButtonColor = Colors.red,
  }) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              MyText(
                text: title,
                size: 24,
                weight: FontWeight.w600,
                color: kBlackColor,
                fontFamily: AppFonts.lexend,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 16.h),

              // Description
              MyText(
                text: description,
                size: 16,
                weight: FontWeight.w400,
                color: Colors.grey.shade600,
                fontFamily: AppFonts.lexend,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 32.h),

              // Confirm button
              GestureDetector(
                onTap: () {
                  Get.back();
                  onConfirm();
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  decoration: BoxDecoration(
                    color: confirmButtonColor,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Center(
                    child: MyText(
                      text: confirmText,
                      size: 16,
                      weight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: AppFonts.lexend,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16.h),

              // Cancel button
              GestureDetector(
                onTap: onCancel ?? () => Get.back(),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Center(
                    child: MyText(
                      text: cancelText,
                      size: 16,
                      weight: FontWeight.w500,
                      color: kBlackColor,
                      fontFamily: AppFonts.lexend,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
}
