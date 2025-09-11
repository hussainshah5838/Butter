import 'package:butter/view/widget/common_image_view_widget.dart';
import 'package:butter/view/widget/my_button.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../config/constants/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../../model/product.dart';
import '../../../screens/dialogs/dialogs.dart';

class EditItemSheet {
  static void show(Product product, BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        margin: EdgeInsets.only(top: 0.1.sh),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.close),
            ),
            33.verticalSpace,
            MyText(text: product.name, size: 20, weight: FontWeight.w600),
            25.verticalSpace,
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Row(
                children: [
                  Expanded(
                    child: MyText(
                      text: "Quantity",
                      size: 14,
                      weight: FontWeight.w500,
                    ),
                  ),
                  CommonImageView(
                    imagePath: Assets.imagesMinusbutton,
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: MyText(
                      text: "1",
                      size: 16,
                      weight: FontWeight.w600,
                      color: kBlackColor,
                    ),
                  ),
                  CommonImageView(
                    imagePath: Assets.imagesAddbutton,
                    height: 25,
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Row(
                children: [
                  Expanded(
                    child: MyText(
                      text: "Units",
                      size: 14,
                      weight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      selectUnit(context);
                    },
                      child: MyText(text: "Off", size: 16, weight: FontWeight.w600)),
                  8.horizontalSpace,
                  Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Row(
                children: [
                  Expanded(
                    child: MyText(
                      text: "Category",
                      size: 14,
                      weight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      selectCategories(product, context);
                    },
                    child: MyText(
                      text: "Produce",
                      size: 16,
                      weight: FontWeight.w600,
                    ),
                  ),
                  8.horizontalSpace,
                  Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
            Divider(),
            30.verticalSpace,
            MyText(
              text: "Notes",
              size: 14,
              weight: FontWeight.w400,
              color: Colors.black.withValues(alpha: 0.50),
            ),
            10.verticalSpace,
            MyText(
              text: "The prewashed ones with the purple label",
              size: 16,
              weight: FontWeight.w500,
              color: Colors.black,
            ),
            Spacer(),
            MyBorderButton(
              textColor: kRedColor,
              buttonText: "Delete item",
              onTap: () {
                DialogHelper.deleteCategoryDialog(context);
              },
            ),
          ],
        ),
      ),
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
    );
  }

  static void selectCategories(Product product, BuildContext context) {
    List<String> categories = [
      "Bakery",
      "Fruits & Vegetables",
      "Dairy Products",
      "Meat & Seafood",
      "Beverages",
      "Snacks & Sweets",
      "Condiments & Spices",
      "Frozen Foods",
    ];

    final RxInt selectedIndex = (-1).obs; // 👈 no controller, just local Rx

    Get.bottomSheet(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        margin: EdgeInsets.only(top: 0.1.sh),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.close),
            ),
            33.verticalSpace,

            // Categories List
            ListView.builder(
              itemCount: categories.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          selectedIndex.value = index; // 👈 update local Rx
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Obx(
                                () => MyText(
                                  text: categories[index],
                                  size: 16,
                                  weight:
                                      selectedIndex.value == index
                                          ? FontWeight.w600
                                          : FontWeight.w400,
                                ),
                              ),
                            ),
                            Obx(
                              () => Container(
                                width: 24.w,
                                height: 24.w,
                                margin: EdgeInsets.only(right: 16.w, top: 2.h),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color:
                                        selectedIndex.value == index
                                            ? kYellowColor
                                            : Colors.white,
                                    width: 2.w,
                                  ),
                                  color:
                                      selectedIndex.value == index
                                          ? kYellowColor
                                          : Colors.transparent,
                                ),
                                child:
                                    selectedIndex.value == index
                                        ? Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 16.sp,
                                        )
                                        : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Divider(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
    );
  }


  static void selectUnit(BuildContext context) {
    final List<String> options1 = ["pack", "can", "jar", "bottle", "box", "bag"];
    final List<String> options2 = ["g", "kg", "ml", "l"];
    final List<String> options3 = ["bunch", "head", "pc", "stick"];

    final RxString selectedValue = "".obs; // 👈 one variable for all lists

    Get.bottomSheet(
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        margin: EdgeInsets.only(top: 0.1.sh),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// CLOSE
            GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(Icons.close),
            ),
            33.verticalSpace,

            /// PACKAGED GOODS
            MyText(
              text: "Packaged Goods",
              size: 12,
              weight: FontWeight.w400,
              color: Colors.black.withValues(alpha: 0.50),
            ),
            15.verticalSpace,
            Obx(
                  () => Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(options1.length, (index) {
                  final isSelected = selectedValue.value == options1[index];
                  return GestureDetector(
                    onTap: () => selectedValue.value = options1[index],
                    child: _buildChip(options1[index], isSelected),
                  );
                }),
              ),
            ),

            33.verticalSpace,

            /// WEIGHT & VOLUME
            MyText(
              text: "Weight and Volume",
              size: 12,
              weight: FontWeight.w400,
              color: Colors.black.withValues(alpha: 0.50),
            ),
            15.verticalSpace,
            Obx(
                  () => Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(options2.length, (index) {
                  final isSelected = selectedValue.value == options2[index];
                  return GestureDetector(
                    onTap: () => selectedValue.value = options2[index],
                    child: _buildChip(options2[index], isSelected),
                  );
                }),
              ),
            ),

            33.verticalSpace,

            /// PRODUCE
            MyText(
              text: "Produce",
              size: 12,
              weight: FontWeight.w400,
              color: Colors.black.withValues(alpha: 0.50),
            ),
            15.verticalSpace,
            Obx(
                  () => Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(options3.length, (index) {
                  final isSelected = selectedValue.value == options3[index];
                  return GestureDetector(
                    onTap: () => selectedValue.value = options3[index],
                    child: _buildChip(options3[index], isSelected),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
    );
  }

  /// Reusable chip widget
  static Widget _buildChip(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? kYellowColor : Colors.transparent,
        border: Border.all(
          width: 0.50,
          color: isSelected ? kYellowColor : Colors.black.withValues(alpha: 0.25),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }

}




