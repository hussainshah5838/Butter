import 'package:butter/config/constants/app_fonts.dart';
import 'package:butter/controller/list_controller.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../config/constants/app_colors.dart';
import '../../../../model/product.dart';

class ShoppingModeSheet {
  static void show(HomeController controller) {
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
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  text:
                      "${controller.totalSelectedCount} ${controller.totalSelectedCount < 2 ? "Item" : "Items"}",
                  size: 24,
                  weight: FontWeight.w700,
                  color: kBlackColor,
                  fontFamily: AppFonts.lexend,
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.close, color: Colors.grey[600], size: 24.sp),
                ),
              ],
            ),

            /// Main Content
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 16.h),
                child: Obx(() {
                  // Group selected products by category
                  Map<String, List<Product>> selectedByCategory = {};

                  for (var category in controller.categories) {
                    List<Product> selectedInCategory =
                        category.products
                            .where(
                              (product) =>
                                  controller.isProductSelected(product.id),
                            )
                            .toList();

                    if (selectedInCategory.isNotEmpty) {
                      selectedByCategory[category.name] = selectedInCategory;
                    }
                  }

                  if (selectedByCategory.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            size: 48.sp,
                            color: Colors.grey[400],
                          ),
                          16.verticalSpace,
                          MyText(
                            text: "No items selected",
                            size: 18.sp,
                            weight: FontWeight.w500,
                            color: Colors.grey[600]!,
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: selectedByCategory.length,
                    itemBuilder: (context, index) {
                      String categoryName = selectedByCategory.keys.elementAt(
                        index,
                      );
                      List<Product> products =
                          selectedByCategory[categoryName]!;

                      return Container(
                        margin: EdgeInsets.only(bottom: 24.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Category Header
                            MyText(
                              text: categoryName,
                              size: 20.sp,
                              weight: FontWeight.w600,
                              color: kBlackColor,
                              fontFamily: AppFonts.lexend,
                            ),
                            12.verticalSpace,

                            // Products in this category
                            ...products.map(
                              (product) => Container(
                                margin: EdgeInsets.only(bottom: 12.h),
                                padding: EdgeInsets.all(12.w),
                                decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  borderRadius: BorderRadius.circular(8.r),
                                  border: Border.all(
                                    color: Colors.grey[200]!,
                                    width: 1.w,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    // Checkmark
                                    Container(
                                      width: 20.w,
                                      height: 20.w,
                                      margin: EdgeInsets.only(right: 12.w),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kYellowColor,
                                        border: Border.all(
                                          color: kYellowColor,
                                          width: 2.w,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 14.sp,
                                      ),
                                    ),

                                    // Product Info
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MyText(
                                            text: product.name,
                                            size: 16.sp,
                                            weight: FontWeight.w600,
                                            color: kBlackColor,
                                          ),
                                          if (product.subtitle != null) ...[
                                            4.verticalSpace,
                                            MyText(
                                              text: product.subtitle!,
                                              size: 13.sp,
                                              weight: FontWeight.w400,
                                              color: Colors.grey[600]!,
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),

                                    // Quantity Badge
                                    if (product.quantity > 1)
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8.w,
                                          vertical: 4.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: kYellowColor.withAlpha(100),
                                          borderRadius: BorderRadius.circular(
                                            12.r,
                                          ),
                                        ),
                                        child: MyText(
                                          text: "×${product.quantity}",
                                          size: 12.sp,
                                          weight: FontWeight.w600,
                                          color: kBlackColor,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
            // Action Buttons
            Row(
              children: [
                // Start Shopping Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kYellowColor,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                    ),
                    child: MyText(
                      text: "Start Shopping",
                      size: 16.sp,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            10.verticalSpace,

            Center(
              child: MyText(
                text: "This will mark these items as bought.",
                size: 12.sp,
                weight: FontWeight.w400,
                color: Colors.grey[600]!,
                textAlign: TextAlign.center,
              ),
            ),

            // Bottom safe area
            SizedBox(height: MediaQuery.of(Get.context!).padding.bottom),
          ],
        ),
      ),
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
    );
  }
}
