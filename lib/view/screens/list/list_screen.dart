import 'package:butter/config/constants/app_fonts.dart';
import 'package:butter/controller/list_controller.dart';
import 'package:butter/model/product.dart';
import 'package:butter/view/widget/bottom_sheets/shopping_mode_sheet/shopping_mode_sheet.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../config/constants/app_colors.dart';
import '../../widget/bottom_sheets/edit_item_sheet/edit_item_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Obx(() {
        if (controller.categories.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wb_twilight_rounded,
                  size: 64.sp,
                  color: Colors.grey[400],
                ),
                16.verticalSpace,
                MyText(
                  text: "No items",
                  size: 32.sp,
                  weight: FontWeight.bold,
                  color: kBlackColor,
                  fontFamily: AppFonts.lexend,
                ),
                8.verticalSpace,
                MyText(
                  textAlign: TextAlign.center,
                  text:
                      "Enjoy the serenity of an empty list.\n Marge is impressed. Temporarily.",
                  size: 14.sp,
                  weight: FontWeight.w400,
                  color: Colors.grey[500]!,
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            final category = controller.categories[index];
            return _buildCategorySection(category);
          },
        );
      }),
    );
  }

  Widget _buildCategorySection(ProductCategory category) {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategoryHeader(category),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child:
                  controller.isCategoryExpanded(category.name)
                      ? _buildProductList(category)
                      : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryHeader(ProductCategory category) {
    return GestureDetector(
      onTap: () => controller.toggleCategory(category.name),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              text: category.name,
              size: 28.sp,
              weight: FontWeight.w600,
              fontFamily: AppFonts.lexend,
              color: kBlackColor,
            ),
            Obx(
              () => AnimatedRotation(
                turns: controller.isCategoryExpanded(category.name) ? 0.5 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: kBlackColor,
                  size: 28.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList(ProductCategory category) {
    return Column(
      children:
          controller.getProductsForCategory(category.name).map((product) {
            return Dismissible(
              key: Key(product.id),
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20.w),
                margin: EdgeInsets.only(bottom: 16.h),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(Icons.delete, color: Colors.white, size: 24.sp),
              ),
              onDismissed:
                  (direction) =>
                      controller.removeProduct(category.name, product.id),
              child: _buildProductTile(product),
            );
          }).toList(),
    );
  }

  Widget _buildProductTile(Product product) {
    return GestureDetector(
      onLongPress: () => EditItemSheet.show(product,context),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //  Bullet Circle
                GestureDetector(
                  onTap: () => controller.toggleProductSelection(product.id),
                  child: Obx(
                    () => Container(
                      width: 24.w,
                      height: 24.w,
                      margin: EdgeInsets.only(right: 16.w, top: 2.h),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color:
                              controller.isProductSelected(product.id)
                                  ? kYellowColor
                                  : Colors.grey[400]!,
                          width: 2.w,
                        ),
                        color:
                            controller.isProductSelected(product.id)
                                ? kYellowColor
                                : Colors.transparent,
                      ),
                      child:
                          controller.isProductSelected(product.id)
                              ? Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16.sp,
                              )
                              : null,
                    ),
                  ),
                ),

                // Product Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: product.name,
                        size: 18.sp,
                        weight: FontWeight.bold,
                        color: kBlackColor,
                      ),
                      if (product.subtitle != null) ...[
                        SizedBox(height: 4.h),
                        MyText(
                          text: product.subtitle!,
                          size: 14.sp,
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
                    margin: EdgeInsets.only(left: 12.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: kYellowColor.withAlpha(100),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: MyText(
                      text: "${product.quantity}",
                      size: 12.sp,
                      weight: FontWeight.w600,
                    ),
                  ),
              ],
            ),
          ),
          Divider(),
          12.verticalSpace,
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Obx(
      () => Visibility(
        visible: controller.totalSelectedCount > 0,
        child: SizedBox(
          width: 100.w,
          child: FloatingActionButton(
            onPressed: () => ShoppingModeSheet.show(controller),
            backgroundColor: kYellowColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: "${controller.totalSelectedCount} sorted",
                  size: 16.sp,
                  weight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
