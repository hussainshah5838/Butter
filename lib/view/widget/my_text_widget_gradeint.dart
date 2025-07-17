
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';

// ignore: must_be_immutable
class MyGradeintText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final TextAlign? textAlign;
  final TextDecoration decoration;
  final FontWeight? weight;
  final TextOverflow? textOverflow;
  final Color? color;
  final FontStyle? fontStyle;
  final VoidCallback? onTap;
  List<Shadow>? shadow;
  final int? maxLines;
  final Paint? paint;
  final double? size;
  final double? lineHeight;
  final double? paddingTop;
  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingBottom;
  final double? letterSpacing;

  MyGradeintText({
    super.key,
    required this.text,
    this.size,
    this.lineHeight,
    this.maxLines = 100,
    this.decoration = TextDecoration.none,
    this.color,
    this.paint,
    this.letterSpacing,
    this.weight = FontWeight.w400,
    this.textAlign,
    this.textOverflow,
    this.fontFamily,
    this.paddingTop = 0,
    this.paddingRight = 0,
    this.paddingLeft = 0,
    this.paddingBottom = 0,
    this.onTap,
    this.shadow,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: GradientText(
        gradientType: GradientType.linear,
        colors: [kSecondaryColor, kSecondaryColor],
        "$text",
        style: TextStyle(
          foreground: paint,
          shadows: shadow,
          fontSize: size ?? 14,
          color: color ?? kSecondaryColor,
          fontWeight: weight,
          decoration: decoration,
          decorationColor: color,
          decorationThickness: 2,
          fontFamily: AppFonts.inter,
          height: lineHeight,
          fontStyle: fontStyle,
          letterSpacing: 0.5,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: textOverflow,
      ),
    );
  }
}
