import 'package:butter/config/constants/app_colors.dart';
import 'package:butter/config/routes/routes_name.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kWhiteColor,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.close),
              ),

              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                        Get.toNamed(RouteName.activityScreen);
                      },
                      child: MyText(
                        text: 'Activity',
                        size: 32.sp,
                        weight: FontWeight.w600,
                      ),
                    ),
                    20.verticalSpace,
                    InkWell(
                      onTap: () {
                        Get.back();
                        Get.toNamed(RouteName.categoriesScreen);
                      },
                      child: MyText(
                        text: 'Categories',
                        size: 32.sp,
                        weight: FontWeight.w600,
                      ),
                    ),
                    20.verticalSpace,
                    InkWell(
                      onTap: () {
                        Get.back();
                        Get.toNamed(RouteName.accountScreen);
                      },
                      child: MyText(
                        text: 'Profile',
                        size: 32.sp,
                        weight: FontWeight.w600,
                      ),
                    ),
                    20.verticalSpace,
                    InkWell(
                      onTap: () {},
                      child: MyText(
                        text: 'Household',
                        size: 32.sp,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: MyText(
                        text: 'Sign out',
                        size: 20.sp,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
