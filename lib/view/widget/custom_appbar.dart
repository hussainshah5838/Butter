import 'package:butter/view/widget/my_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';
import '../../generated/assets.dart';
import 'common_image_view_widget.dart';
import 'my_text_widget.dart';
import 'my_text_widget_gradeint.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton,centerText;
  final List<Widget>? actions;
  final VoidCallback? onBackTap;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.onBackTap,
    this.showBackButton = true,
    this.centerText = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(duration: Duration(milliseconds: 500))],
      child: AppBar(
        centerTitle: centerText,
       // backgroundColor: kSecondaryColor,
        leading: showBackButton == true ? InkWell(
          onTap: onBackTap ?? () => Get.back(),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: CommonImageView(
              svgPath: Assets.svgArrowBack,
              height: 16,
            ),
          ),
        ): null,
        title: MyText(
          text: title,
          size: 20,
          weight: FontWeight.w600,
          color: kSecondaryColor,
        ),
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


///Custom App Bar 2
class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final bool showIcon;
  final VoidCallback onDrawerPressed;

  const CustomAppBar2({
    Key? key,
    this.actions,
    this.showIcon = true,
    required this.onDrawerPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(duration: Duration(milliseconds: 500))],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: AppBar(
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          automaticallyImplyLeading: false,
          leading: showIcon ? InkWell(
            onTap: onDrawerPressed,
              child: Icon(Icons.menu,color: kSecondaryColor,)): null,
          title: CommonImageView(
            //imagePath: Assets.imagesLogo,
            height: 49,
          ),
          actions: actions,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


class CustomAppBar3 extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final VoidCallback onDrawerPressed;

  const CustomAppBar3({
    Key? key,
    required this.onDrawerPressed,
    this.title,
    this.actions,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(duration: Duration(milliseconds: 500))],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: AppBar(
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          leading: GestureDetector(
            onTap: onDrawerPressed,
              child: Icon(Icons.menu,color: kSecondaryColor,)),
          title:title,
          /*MyText(
            text: title!,
            size: 20,
            weight: FontWeight.w600,
            color: kSecondaryColor,
          ),*/
          actions: actions,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}



class CustomAppBar4 extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final VoidCallback onDrawerPressed;

  const CustomAppBar4({
    Key? key,
    required this.onDrawerPressed,
    this.title,
    this.actions,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(duration: Duration(milliseconds: 500))],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: AppBar(
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          leading: GestureDetector(
              onTap: onDrawerPressed,
              child: Icon(Icons.arrow_back,color: kSecondaryColor,)),
          title:title,
          /*MyText(
            text: title!,
            size: 20,
            weight: FontWeight.w600,
            color: kSecondaryColor,
          ),*/
          actions: actions,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


