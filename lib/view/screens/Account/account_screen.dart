import 'package:butter/constants/app_sizes.dart';
import 'package:butter/view/screens/add/bottom_sheet.dart';
import 'package:butter/view/widget/common_image_view_widget.dart';
import 'package:butter/view/widget/custom_appbar.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../generated/assets.dart';
import '../../widget/my_button.dart';
import '../dialogs/dialogs.dart';


class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ""),
      body: Padding(
        padding: AppSizes.DEFAULT,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Stack(
              children: [
                CommonImageView(
                  imagePath: Assets.imagesPpf,
                  height: 100,
                ),
                Positioned(
                  right: 5,
                  bottom: 5,
                  child: GestureDetector(
                    onTap: (){
                      MyBottomSheet.editAvatarSheet(context);
                    },
                    child: CommonImageView(
                      svgPath: Assets.svgEditAvatar,
                    ),
                  ),),
              ],
            ),
            SizedBox(height: 20,),
            MyText(
              text: "Robert",
              size: 32,
              weight: FontWeight.w500,
            ),
            SizedBox(height: 40,),
            Row(
              children: [
                MyText(
                  text: "Units",
                  size: 14,
                  weight: FontWeight.w400,
                  color: Colors.black.withValues(alpha: 0.50),
                ),
                Spacer(),
                MyText(
                  text: "Metric",
                  size: 14,
                  weight: FontWeight.w600,
                ),
                GestureDetector(
                  onTap: (){
                    MyBottomSheet.editMetricSheet(context);
                  },
                    child: Icon(Icons.arrow_forward_ios,size: 18,)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Divider(),
            ),
            Row(
              children: [
                MyText(
                  text: "Notifications",
                  size: 14,
                  weight: FontWeight.w400,
                  color: Colors.black.withValues(alpha: 0.50),
                ),
                Spacer(),
                Switch(
                  padding: EdgeInsets.zero,
                  value: true,
                  onChanged: (val){},
                  activeColor: kPrimaryColor,
                  activeTrackColor: kYellowColor,
                )

              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Divider(),
            ),
            Spacer(),
            MyBorderButton(
              onTap: (){
               DialogHelper.deleteAccountDialog(context);
              },
              buttonText: "Delete Account",
              textColor: kRedColor,

            ),

          ],
        ),
      ),
    );
  }
}
