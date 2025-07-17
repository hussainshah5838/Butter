
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';
import '../../generated/assets.dart';
import 'common_image_view_widget.dart';
class SearchWidget extends StatelessWidget {
  SearchWidget({super.key, required this.searchController});
  TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      style: TextStyle(
          fontWeight: FontWeight.w500,
          color: kPrimaryColor,
          fontSize: 12),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 18),
          hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: kGreyTxColor,
              fontSize: 14,
            fontFamily: AppFonts.inter
          ),
          fillColor: kGreyColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: kGreyColor,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: kGreyColor,
              )),
          hintText: 'Search...'.tr,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Icon(Icons.search,color: kGreyTxColor,),
          )),
    );
  }
}
