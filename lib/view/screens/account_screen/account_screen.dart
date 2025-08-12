import 'package:butter/config/constants/app_fonts.dart';
import 'package:butter/config/constants/app_sizes.dart';
import 'package:butter/view/widget/common_image_view_widget.dart';
import 'package:butter/view/widget/custom_appbar.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../config/constants/app_colors.dart';
import '../../../generated/assets.dart';
import '../../widget/bottom_sheets/unit_sheet/unit_sheet.dart';
import '../../widget/my_button.dart';
import '../../widget/popup/popup.dart';
import '../dialogs/dialogs.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appbar(), body: _body());
  }

  _appbar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () => Get.back(),
        child: Icon(Icons.arrow_back_outlined),
      ),
      title: MyText(text: "Profile", size: 25),
      centerTitle: true,
    );
  }

  _body() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Picture Section
          _buildProfileSection(),

          SizedBox(height: 20.h),

          // Name
          MyText(
            text: "Robert",
            size: 32,
            weight: FontWeight.w500,
            color: kBlackColor,
            fontFamily: AppFonts.lexend,
          ),

          SizedBox(height: 40.h),

          // Units Setting
          _buildSettingRow(
            title: "Units",
            value: "Metric",
            hasArrow: true,
            onTap: () {
              UnitSheet.show();
            },
          ),

          Padding(padding: EdgeInsets.only(top: 15.h), child: _buildDivider()),

          // Notifications Setting
          _buildSettingRow(
            title: "Notifications",
            trailing: Switch(
              padding: EdgeInsets.zero,
              value: notificationsEnabled,
              onChanged: (val) {
                setState(() {
                  notificationsEnabled = val;
                });
              },
              activeColor: kPrimaryColor,
              activeTrackColor: kYellowColor,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: _buildDivider(),
          ),

          Spacer(),

          // Delete Account Button
          SizedBox(
            width: double.infinity,
            child: MyBorderButton(
              onTap: () {
                CustomConfirmationPopup.show(
                  title: "Are you sure?",
                  description:
                      """You’ll be removed from your household, and your personal settings will be lost. Shared lists will remain available to other members.""",
                  confirmButtonText: "Delete",
                  cancelButtonText: "Cancel",
                  onConfirm: () => Get.back(),
                  onCancel: () => Get.back(),
                );
              },
              buttonText: "Delete Account",
              textColor: kRedColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Stack(
      children: [
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.r),
            child: CommonImageView(
              imagePath: Assets.imagesPpf,
              height: 100.h,
              width: 100.w,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: 5.w,
          bottom: 5.h,
          child: Container(
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: CommonImageView(
              svgPath: Assets.svgEditAvatar,
              height: 20.h,
              width: 20.w,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSettingRow({
    required String title,
    String? value,
    Widget? trailing,
    bool hasArrow = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: Row(
          children: [
            MyText(
              text: title,
              size: 14,
              weight: FontWeight.w400,
              color: Colors.black.withOpacity(0.50),
              fontFamily: AppFonts.lexend,
            ),
            Spacer(),
            if (value != null) ...[
              MyText(
                text: value,
                size: 14,
                weight: FontWeight.w600,
                color: kBlackColor,
                fontFamily: AppFonts.lexend,
              ),
              SizedBox(width: 8.w),
            ],
            if (trailing != null)
              trailing
            else if (hasArrow)
              Icon(
                Icons.arrow_forward_ios,
                size: 18.sp,
                color: Colors.grey.shade600,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(height: 1.h, thickness: 0.5, color: Colors.grey.shade300);
  }
}
