import 'package:butter/view/widget/common_image_view_widget.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:butter/view/widget/my_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants/app_colors.dart';
import '../../../generated/assets.dart';

class SearchBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: kWhiteBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 20.h,
            left: 16.w,
            right: 16.w,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Close + Done Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.close, size: 25),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: MyText(
                      text: "Done",
                      size: 14,
                      weight: FontWeight.w600,
                      color: kBlackColor,
                    )
                  ),
                ],
              ),
              25.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: MyTextField(
                      hint: "Type here...",
                      radius: 25,
                      filledColor: Colors.transparent,
                      marginBottom: 0,
                    ),
                  ),
                  8.horizontalSpace,
                  CommonImageView(
                    imagePath: Assets.imagesAddbutton,
                    height: 36,
                  )
                ],
              ),
              50.verticalSpace,
              MyText(
                text: "Suggested",
                color: Colors.black.withValues(alpha: 0.50),
                size: 12,
                weight: FontWeight.w400,
              ),
              15.verticalSpace,
              Wrap(
                spacing: 8,
                runSpacing: 0,

                children: [
                  _chip('Milk'),
                  _chip('Diapers'),
                  _chip('Olive Oil'),
                  _chip('Wetwipes'),
                  _chip('Cereal'),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        );
      },
    );
  }

  static Widget _chip(String text) {
    return Chip(
      label: MyText(
        text: text,
        size: 14,
        weight: FontWeight.w400,
      ),
      backgroundColor: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // radius
        side: BorderSide(
          color:  Colors.black.withValues(alpha: 0.25), // border color
          width: 0.5, // border width
        ),
      ),
    );
  }
}
