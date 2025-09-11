import 'package:butter/view/screens/add/bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_fonts.dart';
import '../../../config/constants/app_sizes.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/my_text_widget.dart';
import 'add_category_bottom_sheet.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      "Bakery",
      "Fruits & Vegetables",
      "Dairy Products",
      "Meat & Seafood",
      "Beverages",
      "Snacks & Sweets",
      "Condiments & Spices",
      "Frozen Foods",
    ];
    return Scaffold(
      appBar: CustomAppBar(
        title: "",
        actions: [
          GestureDetector(
            onTap: (){
              AddCategoryBottomSheet.addCategorySheet(context);
            },
              child: MyText(text: "+ Add", size: 14, weight: FontWeight.w600)),
          SizedBox(width: 15),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: AppSizes.HORIZONTAL,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "Categories",
                  size: 32,
                  weight: FontWeight.w500,
                  fontFamily: AppFonts.lexend,
                ),
                SizedBox(height: 10),
                MyText(
                  text:
                      "Long-press to reorder (your order is personal).\nTap to edit (changes are shared).",
                  size: 12,
                  weight: FontWeight.w300,
                  color: Colors.black.withValues(alpha: 0.50),
                ),
                SizedBox(height: 15),
                ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              MyBottomSheet.deleteCategorySheet(context);
                            },
                            child: MyText(
                              text: categories[index],
                              size: 16,
                              weight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Divider(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
