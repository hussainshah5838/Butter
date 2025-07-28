import 'package:butter/config/constants/app_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_sizes.dart';
import '../../../generated/assets.dart';
import '../../../localization/controller.dart';
import '../../../localization/user_pref.dart';
import '../../widget/common_image_view_widget.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/my_text_widget.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  final List<String> languagesList = ['English', 'Spanish'];

  int selectedIndex = 0;
  final LanguageController languageController = Get.put(LanguageController());

  @override
  void initState() {
    super.initState();
    getLanguageIndex();
  }

  void getLanguageIndex() async {
    selectedIndex = await UserSimplePreferences.getLanguageIndex() ?? 0;
    languageController.currentIndex.value = selectedIndex;
    languageController.isEnglish.value = selectedIndex == 0;
    setState(() {});
  }

  void onSelectLanguage(int index) async {
    setState(() {
      selectedIndex = index;
    });

    // Save selected index
    await UserSimplePreferences.setLanguageIndex(index);
    await UserSimplePreferences.isFirstLaunch(false);

    // Update LanguageController
    String selectedLang = languagesList[index];
    languageController.onLanguageChanged(selectedLang, index);

    //Get.to(()=>CtaProductScreen());
    // You could show a snackbar or reload UI as needed
    Get.snackbar(
      "Success",
      "Language changed to $selectedLang",
      snackPosition: SnackPosition.TOP,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(centerText: false, title: "change_language".tr),
      body: Padding(
        padding: AppSizes.DEFAULT,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              buildLanguageOption(
                index: 0,
                imagePath: "Assets.imagesEnglish",
                title: "Language English",
                subtitle: "hello_my_friend!".tr,
                isSelected: selectedIndex == 0,
              ),
              const SizedBox(height: 25),
              buildLanguageOption(
                index: 1,
                imagePath: "Assets.imagesSpanish",
                title: "Español (spanish)",
                subtitle: "Hola, amigo!",
                isSelected: selectedIndex == 1,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLanguageOption({
    required int index,
    required String imagePath,
    required String title,
    required String subtitle,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => onSelectLanguage(index),
      child: Container(
        width: 311,
        padding: const EdgeInsets.all(30),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: isSelected ? kYellowColor : kTBGColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Row(
          children: [
            CommonImageView(imagePath: imagePath, height: 56),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: title,
                  size: 18,
                  weight: FontWeight.w600,
                  color: isSelected ? kPrimaryColor : kTXBColor,
                  fontFamily: AppFonts.inter,
                ),
                const SizedBox(height: 5),
                MyText(
                  text: subtitle,
                  size: 16,
                  weight: FontWeight.w400,
                  color: isSelected ? kPrimaryColor : kTXBColor,
                  fontFamily: AppFonts.inter,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
