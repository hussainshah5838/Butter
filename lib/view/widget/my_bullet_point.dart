
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import 'my_text_widget.dart';

// ignore: must_be_immutable
class MyBullet extends StatelessWidget {
  MyBullet({super.key, required this.point, this.size});
  String point;
  double? size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: '•',
            //paddingLeft: 25,
            color: kTertiaryColor,
            paddingRight: 10,
          ),
          Expanded(
            child: MyText(
              text: point,
              size: 14,
              weight: FontWeight.w400,
              color: kTertiaryColor,
              lineHeight: 1.51,
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
