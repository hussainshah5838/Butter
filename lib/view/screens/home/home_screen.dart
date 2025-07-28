import 'package:butter/config/constants/app_fonts.dart';
import 'package:butter/config/constants/app_sizes.dart';
import 'package:butter/view/widget/common_image_view_widget.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

import '../../../config/constants/app_colors.dart';
import '../../../generated/assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSelected = false;
  bool _showItems = false;
  Map<String, bool> _expandedSections = {
    "Produce": false,
    "Pantry": false,
    "Baby": false,
    "House Hold": false,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            children: [
              buildExpandableSection("Produce", [
                buildProductTile(
                  title: "Bananas",
                  isSelected: isSelected,
                  onChanged: (value) {
                    setState(() {
                      isSelected = value!;
                    });
                  },
                ),
                buildProductTile(
                  title: "Tomatoes",
                  isSelected: false,
                  onChanged: (value) {
                    // handle logic here
                  },
                ),
              ]),

              buildExpandableSection("Pantry", [
                buildProductTile(
                  title: "Bananas",
                  isSelected: isSelected,
                  onChanged: (value) {
                    setState(() {
                      isSelected = value!;
                    });
                  },
                ),
                buildProductTile(
                  title: "Tomatoes",
                  isSelected: false,
                  onChanged: (value) {
                    // handle logic here
                  },
                ),
              ]),

              buildExpandableSection("Baby", [
                buildProductTile(
                  title: "Bananas",
                  isSelected: isSelected,
                  onChanged: (value) {
                    setState(() {
                      isSelected = value!;
                    });
                  },
                ),
                buildProductTile(
                  title: "Tomatoes",
                  isSelected: false,
                  onChanged: (value) {
                    // handle logic here
                  },
                ),
              ]),

              buildExpandableSection("House Hold", [
                buildProductTile(
                  title: "Bananas",
                  isSelected: isSelected,
                  onChanged: (value) {
                    setState(() {
                      isSelected = value!;
                    });
                  },
                ),
                buildProductTile(
                  title: "Tomatoes",
                  isSelected: false,
                  onChanged: (value) {
                    // handle logic here
                  },
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildExpandableSection(String title, List<Widget> children) {
    final isExpanded = _expandedSections[title] ?? false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              text: title,
              size: 32,
              weight: FontWeight.w500,
              fontFamily: AppFonts.lexend,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _expandedSections[title] = !isExpanded;
                });
              },
              child: CommonImageView(svgPath: Assets.svgArrowDown),
            ),
          ],
        ),
        if (isExpanded) ...children,
      ],
    );
  }

  Widget buildProductTile({
    required String title,
    String? subtitle,
    String? trailingText,
    required bool isSelected,
    required ValueChanged<bool?> onChanged,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,
      horizontalTitleGap: 0,
      leading: Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: kYellowColor, // Inactive color
        ),
        child: Radio<bool>(
          visualDensity: VisualDensity.compact,
          value: true,
          groupValue: isSelected,
          activeColor: kYellowColor, // Active color
          onChanged: onChanged,
        ),
      ),
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
              ? MyText(
                text: trailingText,
                size: 10,
                color: kBlackColor,
                weight: FontWeight.w600,
              )
              : null,
    );
  }
}
