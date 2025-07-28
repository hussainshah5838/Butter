import 'package:flutter/material.dart';

import '../../config/constants/app_colors.dart';

class CheckBoxWidget extends StatelessWidget {
  final bool isChecked;
  final Function(bool?)? onChanged;
  final LinearGradient kborderGradient;

  CheckBoxWidget({
    super.key,
    this.isChecked = false,
    required this.onChanged,
    this.kborderGradient = kPrimaryGradeintColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
        child: Checkbox(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          checkColor: Colors.white,
          activeColor:
              Colors
                  .transparent, // Active color will not be used as we're using fillColor
          fillColor: MaterialStateProperty.resolveWith<Color>((
            Set<MaterialState> states,
          ) {
            if (states.contains(MaterialState.selected)) {
              // When checked, return a transparent color so that we can control it via decoration
              return Colors.transparent;
            }
            return Colors.white;
          }),
          value: isChecked,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
