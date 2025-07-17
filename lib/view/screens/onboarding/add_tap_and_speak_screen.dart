import 'package:butter/constants/app_fonts.dart';
import 'package:butter/view/widget/common_image_view_widget.dart';
import 'package:butter/view/widget/my_textfeild.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../../../generated/assets.dart';
import '../../widget/my_text_widget.dart';


class AddTapAndSpeakScreen extends StatefulWidget {
  const AddTapAndSpeakScreen({super.key});

  @override
  State<AddTapAndSpeakScreen> createState() => _AddTapAndSpeakScreenState();
}

class _AddTapAndSpeakScreenState extends State<AddTapAndSpeakScreen> {
  bool isRecording = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.23, 0.42),
            radius: 1.04,
            colors: [const Color(0xFFFFEFBC), Colors.white],
          ),
        ),
        child: SafeArea(

          child: Padding(
            padding: AppSizes.DEFAULT,
            child: Column(
              children: [
                if(isRecording)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Align(
                        alignment: Alignment.topRight,
                        child: MyText(
                          text: "Skip",
                          size: 14,
                          weight: FontWeight.w400,
                          color: Colors.black.withValues(alpha: 0.50),
                        ),
                      ),
                      Spacer(),
                      MyText(
                        text: "Tap and speak",
                        size: 32,
                        weight: FontWeight.w500,
                        fontFamily: AppFonts.lexend,
                        letterSpacing: -1.60,
                      ),
                      SizedBox(height: 15,),
                      MyText(
                        text: '“Add 2 onions, bacon, and a can of tomatoes”\n“Olive oil, the one with the red label”\n“We’re out of diapers”\n',
                        color: Colors.black.withValues(alpha: 0.50),
                        size: 14,
                        weight: FontWeight.w300,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 25,),
                      CommonImageView(
                        imagePath: Assets.imagesMic,
                        height: 100,
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 0.50,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Colors.black.withValues(alpha: 0.25),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 51,
                            child: Text(
                              'Or',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black.withValues(alpha: 0.50),
                                fontSize: 12,
                                fontFamily: AppFonts.inter,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 0.50,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Colors.black.withValues(alpha: 0.25),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 60,),
                      MyTextField(
                        hint: "Type here...",
                        suffix: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(Icons.arrow_forward),
                        ),
                        radius: 25,
                        filledColor: kSecondary2Color,

                        marginBottom: 0,
                      )



                    ],
                  ),
                ),
                if(!isRecording)
                Expanded(
                  child: Column(
                    children: [
                      Spacer(),
                      Spacer(),
                      CommonImageView(
                        svgPath: Assets.svgSoundwaves,
                      ),
                      SizedBox(height: 15,),
                      MyText(
                        text: "Listening",
                        size: 12,
                        weight: FontWeight.w300,
                        color: Colors.black.withValues(alpha: 0.50),
                      ),
                      Spacer(),
                      CommonImageView(
                        svgPath: Assets.svgStop,
                      ),
                      Spacer(),
                      Spacer(),

                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
