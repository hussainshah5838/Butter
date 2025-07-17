import 'package:butter/constants/app_sizes.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/app_colors.dart';
import '../screens/bottom_nav_bar/bottom_nav_bar.dart';
import '../screens/dialogs/dialogs.dart';

class CustomDrawer extends StatelessWidget {
  final void Function(int index)? onItemSelected;
  const CustomDrawer({super.key,this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              _buildDrawerItem("save_with_our_memberships".tr,  () {
                //onItemSelected?.call(2); // trigger callback with index 2
                Get.offAll(() => BottomNavBar(initialIndex: 2));
              }),
              _buildDrawerItem("buy_a_wash".tr,  () {
                //Get.to(()=>BuyAWashScreen(check: false,));
              }),
              _buildDrawerItem("my_account".tr,  () {
               // Get.to(()=>ProfileScreen());
              }),
              _buildDrawerItem("wash_history".tr,  () {
                //onItemSelected?.call(1); // trigger callback with index 2
                //Navigator.pop(context);
                Get.offAll(() => BottomNavBar(initialIndex: 1)); // close drawer
              }),
              _buildDrawerItem("about_us".tr,  () {
               // Get.to(()=>AboutUsScreen());
              }),
              _buildDrawerItem("locations".tr,  () {
                // close drawer
              }),
              _buildDrawerItem("faqs".tr,  () {
                //Get.to(()=>AppNavigationTipsScreen());
              }),
              _buildDrawerItem("app_Navigation_Tips".tr,  () {
               //Get.to(()=>FaqsScreen());
              }),
              _buildDrawerItem("privacy_policy".tr,  () {
                //Get.to(()=>PrivacyPolicyScreen());
              }),
              _buildDrawerItem("terms_of_use".tr,  () {
                //Get.to(()=>TermOfUseScreen());
              }),
              _buildDrawerItem("contact_us".tr,  () {
               // Get.to(()=>ContactUsScreen());
              }),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: ListTile(
                  minTileHeight: 0,
                  contentPadding: EdgeInsets.zero,
                  title: MyText(text: "logout1".tr,size: 16,weight: FontWeight.w600,),
                  onTap: (){
                    DialogHelper.logoutDialog(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String title, VoidCallback onTap) {
    return Padding(
      padding: AppSizes.HORIZONTAL,
      child: Column(
        children: [
          ListTile(
            minTileHeight: 0,
            contentPadding: EdgeInsets.zero,
            title: MyText(text: title,size: 16,weight: FontWeight.w600,),
            onTap: onTap,
          ),
          Divider(color: kTertiaryColor.withOpacity(0.3),),
        ],
      ),
    );
  }
}
