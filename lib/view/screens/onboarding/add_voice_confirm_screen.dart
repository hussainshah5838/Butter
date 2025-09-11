import 'package:butter/config/constants/app_fonts.dart';
import 'package:butter/view/widget/my_button.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_sizes.dart';
import '../../../config/routes/routes_name.dart';

class AddVoiceConfirmScreen extends StatefulWidget {
  const AddVoiceConfirmScreen({super.key});

  @override
  State<AddVoiceConfirmScreen> createState() => _AddVoiceConfirmScreenState();
}

class _AddVoiceConfirmScreenState extends State<AddVoiceConfirmScreen> {
  /// DUMMY DATA WILL BE REPLACED WITH REAL DATA
  List<ProductItem> items = [
    ProductItem(title: "Bananas"),
    ProductItem(title: "Carrots", quantity: "8"),
    ProductItem(title: "Cherry toms"),
    ProductItem(title: "Olive oil"),
    ProductItem(title: "Bananas"),
    ProductItem(title: "Carrots", quantity: "3"),
    ProductItem(title: "Cherry toms"),
    ProductItem(title: "Olive oil"),
    ProductItem(title: "Bananas"),
    ProductItem(title: "Carrots", quantity: "1"),
    ProductItem(title: "Cherry toms"),
    ProductItem(title: "Olive oil"),
    ProductItem(
      title: "Spinach",
      subtitle: "The prewashed ones with the purple label",
      quantity: "2",
    ),
  ];

  void _deleteItem(int index) {
    setState(() => items.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.23, 0.42),
            radius: 1.04,
            colors: [Color(0xFFFFEFBC), Colors.white],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(Icons.arrow_back, color: kBlackColor),
                ),

                30.verticalSpace,

                MyText(
                  text: "Confirm items",
                  size: 32.sp,
                  weight: FontWeight.w500,
                  letterSpacing: -1.60,
                  fontFamily: AppFonts.lexend,
                ),
                4.verticalSpace,
                MyText(
                  text: "Tap to edit. Swipe left to delete.",
                  size: 14.sp,
                  color: Colors.black.withValues(alpha: 0.50),
                  weight: FontWeight.w300,
                ),

                24.verticalSpace,

                Expanded(
                  child:
                      items.isEmpty
                          ? Center(
                            child: MyText(
                              text: "No items added yet",
                              size: 16.sp,
                              color: Colors.black.withValues(alpha: 0.50),
                              weight: FontWeight.w300,
                            ),
                          )
                          : ListView.separated(
                            itemCount: items.length,
                            separatorBuilder:
                                (context, index) => _buildDivider(),
                            itemBuilder: (context, index) {
                              final item = items[index];
                              return _buildProductTile(
                                index: index,
                                title: item.title,
                                subtitle: item.subtitle,
                                trailingText: item.quantity,
                              );
                            },
                          ),
                ),

                24.verticalSpace,

                MyButton(
                  onTap: () => Get.toNamed(RouteName.main),
                  buttonText: "Looks good",
                  height: 50.h,
                ),

                16.verticalSpace,

                GestureDetector(
                  onTap: () => Get.back(),
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: MyText(
                        text: "Cancel",
                        size: 14.sp,
                        weight: FontWeight.w300,
                        color: Colors.black.withValues(alpha: 0.70),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductTile({
    required int index,
    required String title,
    String? subtitle,
    String? trailingText,
  }) {
    return Dismissible(
      key: Key('${title}_$index'),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20.w),
        decoration: BoxDecoration(
          color: Colors.red.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.delete_outline, color: Colors.red),
            4.verticalSpace,
            MyText(
              text: "Delete",
              size: 12.sp,
              color: Colors.red,
              weight: FontWeight.w500,
            ),
          ],
        ),
      ),
      onDismissed: (direction) {
        _deleteItem(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.verticalSpace,
                  MyText(
                    text: title,
                    size: 16.sp,
                    color: kBlackColor,
                    weight: FontWeight.w600,
                  ),
                  if (subtitle != null) ...[
                    4.verticalSpace,
                    MyText(
                      text: subtitle,
                      size: 12.sp,
                      weight: FontWeight.w300,
                      color: Colors.black.withValues(alpha: 0.50),
                    ),
                  ],
                  10.verticalSpace,
                ],
              ),
            ),

            // Trailing content
            if (trailingText != null) ...[
              16.horizontalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: kYellowColor.withAlpha(100),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: MyText(
                  text: trailingText,
                  size: 12.sp,
                  color: kBlackColor,
                  weight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1.h,
      thickness: 1,
      color: Colors.black.withValues(alpha: 0.08),
      indent: 0,
      endIndent: 0,
    );
  }
}

/// DUMMY FOR NOW
class ProductItem {
  final String title;
  final String? subtitle;
  final String? quantity;

  ProductItem({required this.title, this.subtitle, this.quantity});
}
