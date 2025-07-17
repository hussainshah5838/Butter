

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';
import 'custom_animated_row.dart';
import 'my_text_widget.dart';

class TermsCheckbox extends StatefulWidget {
  final String? text;

  final Color? textcolor;
  final Function(bool) onChanged;

  const TermsCheckbox({
    super.key,
    this.text,
    required this.onChanged,
    this.textcolor,
  });

  @override
  _TermsCheckboxState createState() => _TermsCheckboxState();
}

class _TermsCheckboxState extends State<TermsCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedRow(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isChecked = !_isChecked;
            });
            widget.onChanged(_isChecked);
          },
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _isChecked ? kYellowColor : null,
              border: Border.all(
                color: kYellowColor,
                width: 2,
              ),
            ),
            child: _isChecked
                ? Icon(
                    Icons.check,
                    color: kSecondaryColor,
                    size: 15,
                  )
                : null,
          ),
        ),
        SizedBox(width: 10),
        Flexible(
          child: MyText(
            text: widget.text ?? '',
            size: 12,
            color: kWhiteLightColor,
            fontFamily: AppFonts.inter,
            weight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}




class RichTermCheckBox extends StatefulWidget {
  final Function(bool) onChanged;
  const RichTermCheckBox({super.key, required this.onChanged});

  @override
  State<RichTermCheckBox> createState() => _RichTermCheckBoxState();
}

class _RichTermCheckBoxState extends State<RichTermCheckBox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedRow(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isChecked = !_isChecked;
            });
            widget.onChanged(_isChecked);
          },
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _isChecked ? kYellowColor : null,
              border: Border.all(
                color: kYellowColor,
                width: 2,
              ),
            ),
            child: _isChecked
                ? Icon(
              Icons.check,
              color: kSecondaryColor,
              size: 15,
            )
                : null,
          ),
        ),
        SizedBox(width: 10),
        Flexible(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'i_accept_terms'.tr,
                  style: TextStyle(
                    color: kTertiaryColor,
                    fontSize: 12,
                    fontFamily: AppFonts.inter,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'terms_condition'.tr,
                  style: TextStyle(
                    color: kYellowColor,
                    fontSize: 12,
                    fontFamily: AppFonts.inter,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
