import 'package:butter/constants/app_fonts.dart';
import 'package:butter/constants/app_sizes.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/app_colors.dart';
import '../screens/Account/account_screen.dart';
import '../screens/Activity/activity_screen.dart';
import '../screens/bottom_nav_bar/bottom_nav_bar.dart';
import '../screens/categories/categories_screen.dart';
import '../screens/dialogs/dialogs.dart';
import '../screens/household/house_hold_screen.dart';

class CustomDrawer extends StatefulWidget {
  final void Function(int index)? onItemSelected;
  const CustomDrawer({super.key,this.onItemSelected});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kPrimaryColor,
      child: Padding(
        padding: AppSizes.DEFAULT,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Get.back();
                },
                  child: Icon(Icons.close)),
              SizedBox(height: 20,),
              _buildDrawerItem("Activity",0,  () {
                Get.to(()=>ActivityScreen());
              }),
              _buildDrawerItem("Categories",1,  () {
                Get.to(()=>CategoriesScreen());
              }),
              _buildDrawerItem("Profile", 2, () {
                Get.to(()=>AccountScreen());
              }),
              _buildDrawerItem("Household", 3, () {
                Get.to(()=>HouseHoldScreen()); // close drawer
              }),
              Spacer(),
              _buildDrawerItem2("Share app",  () {
                // Get.to(()=>ProfileScreen());
              }),
              _buildDrawerItem2("Rate app",  () {
                // Get.to(()=>ProfileScreen());
              }),
              _buildDrawerItem2("Give feedback",  () {
                // Get.to(()=>ProfileScreen());
              }),
              _buildDrawerItem2("Support",  () {
                // Get.to(()=>ProfileScreen());
              }),
              _buildDrawerItem2("Sign out",  () {
                // Get.to(()=>ProfileScreen());
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String title, int index, VoidCallback onTap) {
    bool isSelected = selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
          onTap();
        },
        child: Row(
          children: [
            MyText(
              text: title,
              size: 32,
              weight: FontWeight.w500,
              fontFamily: AppFonts.lexend,
              letterSpacing: -1.60,
            ),
            const SizedBox(width: 8),
            if (isSelected)
              Container(
                width: 12,
                height: 12,
                decoration: ShapeDecoration(
                  color: kYellowColor,
                  shape: const OvalBorder(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem2(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: onTap,
        child: MyText(
          text: title,
          size: 20,
          weight: FontWeight.w600,
        ),
      ),
    );
  }
}
