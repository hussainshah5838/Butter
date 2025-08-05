import 'package:butter/config/constants/app_colors.dart';
import 'package:butter/config/constants/app_fonts.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UnitSheet extends StatefulWidget {
  static void show({String? currentUnit, Function(String)? onUnitSelected}) {
    Get.bottomSheet(
      UnitSheet(
        currentUnit: currentUnit ?? "Metric",
        onUnitSelected: onUnitSelected,
      ),
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
    );
  }

  final String currentUnit;
  final Function(String)? onUnitSelected;

  const UnitSheet({super.key, required this.currentUnit, this.onUnitSelected});

  @override
  State<UnitSheet> createState() => _UnitSheetState();
}

class _UnitSheetState extends State<UnitSheet> {
  late String selectedUnit;
  final List<String> units = ["Imperial", "Metric"];

  @override
  void initState() {
    super.initState();
    selectedUnit = widget.currentUnit;
  }

  void _selectUnit(String unit) {
    setState(() {
      selectedUnit = unit;
    });

    // Call the callback function
    if (widget.onUnitSelected != null) {
      widget.onUnitSelected!(unit);
    }

    // Close the sheet
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      margin: EdgeInsets.only(top: 0.3.sh),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header with close button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 24.w), // Balance the close button
              MyText(
                text: "Select Unit",
                size: 18,
                weight: FontWeight.w600,
                fontFamily: AppFonts.lexend,
                color: kBlackColor,
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: Icon(Icons.close, color: kBlackColor, size: 24.sp),
              ),
            ],
          ),

          SizedBox(height: 30.h),

          // Unit options
          ...units.map((unit) => _buildUnitOption(unit)).toList(),

          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget _buildUnitOption(String unit) {
    final bool isSelected = unit == selectedUnit;

    return GestureDetector(
      onTap: () => _selectUnit(unit),
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        margin: EdgeInsets.only(bottom: 8.h),
        child: Row(
          children: [
            Expanded(
              child: MyText(
                text: unit,
                size: 16,
                weight: isSelected ? FontWeight.w600 : FontWeight.w400,
                fontFamily: AppFonts.lexend,
                color: isSelected ? kBlackColor : Colors.grey.shade600,
              ),
            ),

            // Checkmark for selected unit
            if (isSelected)
              Container(
                width: 24.w,
                height: 24.h,
                decoration: BoxDecoration(
                  color: kYellowColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(Icons.check, color: Colors.white, size: 16.sp),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
