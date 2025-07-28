import 'dart:async';

import 'package:butter/config/constants/app_fonts.dart';
import 'package:butter/config/constants/app_sizes.dart';
import 'package:butter/view/widget/common_image_view_widget.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:butter/view/widget/my_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/constants/app_colors.dart';
import '../../../generated/assets.dart';
import '../../widget/my_button.dart';
import '../dialogs/dialogs.dart';

class MyBottomSheet {
  static void show(BuildContext context) {
    Get.bottomSheet(
      ignoreSafeArea: true,
      SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: AppSizes.DEFAULT,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(alignment: Alignment.topLeft, child: Icon(Icons.close)),
              SizedBox(height: 100),
              MyText(
                text: "Tap and speak",
                size: 32,
                weight: FontWeight.w500,
                fontFamily: AppFonts.lexend,
                letterSpacing: -1.60,
              ),
              SizedBox(height: 10),
              MyText(
                text:
                    '“Add 2 onions, bacon, and a can of tomatoes”\n“Olive oil, the one with the red label”\n“We’re out of diapers”\n',
                size: 14,
                weight: FontWeight.w300,
                color: Colors.black.withValues(alpha: 0.50),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Get.back();
                  MyBottomSheet.addVoiceSheet(context);
                },
                child: CommonImageView(
                  imagePath: Assets.imagesMic,
                  height: 100,
                ),
              ),
              SizedBox(height: 50),
              Row(
                children: [
                  Expanded(
                    child: Divider(color: Colors.black.withValues(alpha: 0.25)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: MyText(
                      text: "Or",
                      size: 12,
                      weight: FontWeight.w300,
                      color: Colors.black.withValues(alpha: 0.50),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: Colors.black.withValues(alpha: 0.25)),
                  ),
                ],
              ),
              SizedBox(height: 50),
              MyTextField(
                filledColor: Colors.transparent,
                radius: 25,
                hint: "Type here...",
                hintColor: Colors.black.withValues(alpha: 0.25),
                suffix: Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      MyBottomSheet.addTextSheet(context);
                    },
                    child: Icon(Icons.arrow_forward),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: true, // if your sheet content is large
    );
  }

  static void addVoiceSheet(BuildContext context) {
    bool isProcessing = false; // Move it outside builder

    Get.bottomSheet(
      ignoreSafeArea: true,
      StatefulBuilder(
        builder: (context, setState) {
          void onStopTapped() {
            setState(() {
              isProcessing = true;
            });
            // Trigger after 5 seconds
            Timer(Duration(seconds: 5), () {
              Get.back();
              MyBottomSheet.addConfirmItemSheet(context);
            });
          }

          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: AppSizes.DEFAULT,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  if (!isProcessing)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Icon(Icons.close),
                        ),
                        SizedBox(height: 50),
                        CommonImageView(svgPath: Assets.svgSoundwaves),
                        SizedBox(height: 15),
                        MyText(
                          text: "Listening",
                          size: 12,
                          weight: FontWeight.w300,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        SizedBox(height: 50),
                        GestureDetector(
                          onTap: onStopTapped,
                          child: CommonImageView(svgPath: Assets.svgStop),
                        ),
                        SizedBox(height: 100),
                      ],
                    ),
                  if (isProcessing)
                    Column(
                      children: [
                        SizedBox(height: 100),
                        CommonImageView(svgPath: Assets.svgProcessing),
                        SizedBox(height: 15),
                        MyText(
                          text: "Processing",
                          size: 12,
                          weight: FontWeight.w300,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        SizedBox(height: 100),
                      ],
                    ),
                ],
              ),
            ),
          );
        },
      ),
      isScrollControlled: true,
    );
  }

  static void addConfirmItemSheet(BuildContext context) {
    // Move it outside builder

    Get.bottomSheet(
      ignoreSafeArea: true,
      StatefulBuilder(
        builder: (context, setState) {
          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: AppSizes.DEFAULT,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyText(
                    text: "Confirm items",
                    size: 32,
                    weight: FontWeight.w500,
                    letterSpacing: -1.60,
                    fontFamily: AppFonts.lexend,
                  ),
                  MyText(
                    text: "Tap to edit. Swipe left to delete.",
                    size: 14,
                    color: Colors.black.withValues(alpha: 0.50),
                    weight: FontWeight.w300,
                  ),
                  SizedBox(height: 40),

                  buildProductTile(title: "Bananas"),
                  Divider(),
                  buildProductTile(title: "Carrots", trailingText: "1"),
                  Divider(),
                  buildProductTile(title: "Cherry toms"),
                  Divider(),
                  buildProductTile(title: "Olive oil"),
                  Divider(),
                  buildProductTile(
                    title: "Spinach",
                    subtitle: 'The prewashed ones with the purple label',
                    trailingText: "2",
                  ),
                  Divider(),
                  SizedBox(height: 50),
                  MyButton(
                    onTap: () {
                      Get.back();
                    },
                    buttonText: "Looks good",
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                        MyBottomSheet.show(context);
                      },
                      child: MyText(
                        text: "Cancel",
                        size: 14,
                        weight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      isScrollControlled: true,
    );
  }

  static buildProductTile({
    required String title,
    String? subtitle,
    String? trailingText,
  }) {
    return ListTile(
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,
      title: MyText(
        text: title,
        size: 16,
        color: kBlackColor,
        weight: FontWeight.w600,
      ),
      subtitle:
          subtitle != null
              ? MyText(
                text: subtitle,
                size: 10,
                weight: FontWeight.w300,
                color: Colors.black.withOpacity(0.5),
              )
              : null,
      trailing:
          trailingText != null
              ? Container(
                height: 25,
                padding: const EdgeInsets.all(7),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFFFFF6D8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: MyText(
                  text: trailingText,
                  size: 10,
                  color: kBlackColor,
                  weight: FontWeight.w600,
                ),
              )
              : null,
    );
  }

  static void addTextSheet(BuildContext context) {
    final List<String> items = ["Milk", "Eggs", "Cheese", "Butter"];
    int selectedIndex = -1;

    Get.bottomSheet(
      ignoreSafeArea: true,
      isScrollControlled: true,
      StatefulBuilder(
        builder: (context, setState) {
          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: AppSizes.DEFAULT,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.close),
                      MyText(text: "Done", size: 14, weight: FontWeight.w600),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Expanded(
                        child: MyTextField(
                          filledColor: Colors.transparent,
                          radius: 25,
                          marginBottom: 0,
                          hint: "Type here...",
                          hintColor: Colors.black.withValues(alpha: 0.25),
                        ),
                      ),
                      SizedBox(width: 10),
                      CommonImageView(
                        imagePath: Assets.imagesAddYellowButton,
                        height: 40,
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Align(
                    alignment: Alignment.topLeft,
                    child: MyText(
                      text: "Suggested",
                      size: 12,
                      weight: FontWeight.w400,
                      color: Colors.black.withValues(alpha: 0.50),
                    ),
                  ),
                  SizedBox(height: 20),
                  SelectableChips(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  static void completedItemsSheet(BuildContext context) {
    Get.bottomSheet(
      ignoreSafeArea: true,
      isScrollControlled: true,
      StatefulBuilder(
        builder: (context, setState) {
          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: AppSizes.DEFAULT,
              decoration: ShapeDecoration(
                color: const Color(0xFFFFF6D8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x0C000000),
                    blurRadius: 10,
                    offset: Offset(0, -5),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.close),
                  SizedBox(height: 30),
                  MyText(
                    text: "2 items",
                    size: 32,
                    weight: FontWeight.w500,
                    fontFamily: AppFonts.lexend,
                    letterSpacing: -1.60,
                  ),
                  SizedBox(height: 20),
                  MyText(text: "Produce", size: 14, weight: FontWeight.w300),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 25,
                      height: 25,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFFD13B),
                        shape: OvalBorder(
                          side: BorderSide(
                            width: 1.50,
                            color: const Color(0xFFFFD13B),
                          ),
                        ),
                      ),
                      child: Icon(Icons.check, size: 15, color: kWhiteBgColor),
                    ),
                    title: MyText(
                      text: "Carrots",
                      size: 16,
                      weight: FontWeight.w600,
                    ),
                    trailing: MyText(
                      text: "4",
                      size: 10,
                      weight: FontWeight.w600,
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 20),
                  MyText(text: "Pantry", size: 14, weight: FontWeight.w300),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 25,
                      height: 25,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFFD13B),
                        shape: OvalBorder(
                          side: BorderSide(
                            width: 1.50,
                            color: const Color(0xFFFFD13B),
                          ),
                        ),
                      ),
                      child: Icon(Icons.check, size: 15, color: kWhiteBgColor),
                    ),
                    title: MyText(
                      text: "Olive Oil",
                      size: 16,
                      weight: FontWeight.w600,
                    ),
                    trailing: MyText(
                      text: "4",
                      size: 10,
                      weight: FontWeight.w600,
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 30),
                  MyBorderButton(
                    onTap: () {
                      DialogHelper.undoShoppingDialog(context);
                    },
                    buttonText: "Undo shopping",
                    textColor: kRedColor,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  static void deleteCategorySheet(BuildContext context) {
    Get.bottomSheet(
      ignoreSafeArea: true,
      isScrollControlled: true,
      StatefulBuilder(
        builder: (context, setState) {
          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: AppSizes.DEFAULT,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.close),
                  SizedBox(height: 30),
                  TextField(
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.lexend,
                    ),
                    cursorColor: kYellowColor,
                    cursorHeight: 35,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Category",
                      hintStyle: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppFonts.lexend,
                        color: Colors.black.withValues(alpha: 0.20),
                      ),
                    ),
                  ),
                  SizedBox(height: 130),
                  MyBorderButton(
                    onTap: () {
                      DialogHelper.deleteCategoryDialog(context);
                    },
                    buttonText: "Delete shopping",
                    textColor: kRedColor,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SelectableChips extends StatefulWidget {
  const SelectableChips({super.key});

  @override
  State<SelectableChips> createState() => _SelectableChipsState();
}

class _SelectableChipsState extends State<SelectableChips> {
  final List<String> items = ["Milk", "Eggs", "Cheese", "Butter"];
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      runSpacing: 10,
      alignment: WrapAlignment.start, // ✅ Align children to the start (left)
      runAlignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: List.generate(items.length, (index) {
        final isSelected = selectedIndex == index;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
            decoration: ShapeDecoration(
              color: isSelected ? kYellowColor : Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.5,
                  color:
                      isSelected
                          ? Colors.transparent
                          : Colors.black.withOpacity(0.25),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: MyText(
              text: items[index],
              size: 14,
              weight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        );
      }),
    );
  }
}
