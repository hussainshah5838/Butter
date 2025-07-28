import 'dart:developer';

import 'package:butter/config/constants/app_fonts.dart';
import 'package:butter/view/widget/common_image_view_widget.dart';
import 'package:butter/view/widget/my_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../../../config/constants/app_colors.dart';
import '../../../config/routes/routes_name.dart';
import '../../../generated/assets.dart';
import '../../widget/my_text_widget.dart';

class AddTapAndSpeakScreen extends StatefulWidget {
  const AddTapAndSpeakScreen({super.key});

  @override
  State<AddTapAndSpeakScreen> createState() => _AddTapAndSpeakScreenState();
}

class _AddTapAndSpeakScreenState extends State<AddTapAndSpeakScreen>
    with TickerProviderStateMixin {
  final RxBool isRecording = false.obs;
  final TextEditingController _textController = TextEditingController();
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _toggleRecording() {
    isRecording.value = !isRecording.value;
    if (isRecording.value) {
      _pulseController.repeat(reverse: true);
    } else {
      _pulseController.stop();
      _pulseController.reset();
    }
  }

  void _onSkipTapped() {
    Navigator.pop(context);
  }

  void _onSubmitText() {
    if (_textController.text.trim().isNotEmpty) {
      Get.toNamed(RouteName.onboardingAddVoiceConfirmScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.23, 0.42),
            radius: 1.04,
            colors: [Color(0xFFFFEFBC), Colors.white],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            child: Column(
              children: [
                Obx(
                  () =>
                      isRecording.value
                          ? _buildRecordingView()
                          : _buildListeningView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecordingView() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildSkipButton(),
          const Spacer(),
          _buildTitle(),
          SizedBox(height: 15.h),
          _buildExampleTexts(),
          SizedBox(height: 25.h),
          _buildMicrophoneButton(),
          const Spacer(),
          _buildDividerWithOr(),
          SizedBox(height: 60.h),
          _buildTextInput(),
        ],
      ),
    );
  }

  Widget _buildListeningView() {
    return Expanded(
      child: Column(
        children: [
          const Spacer(),
          const Spacer(),
          AnimatedBuilder(
            animation: _pulseAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _pulseAnimation.value,
                child: CommonImageView(svgPath: Assets.svgSoundwaves),
              );
            },
          ),
          15.verticalSpace,
          MyText(
            text: "Listening...",
            size: 12.sp,
            weight: FontWeight.w300,
            color: Colors.black.withAlpha(128),
          ),
          const Spacer(),
          GestureDetector(
            onTap: _toggleRecording,
            child: CommonImageView(svgPath: Assets.svgStop),
          ),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildSkipButton() {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: _onSkipTapped,
        child: MyText(
          text: "Skip",
          size: 14.sp,
          weight: FontWeight.w400,
          color: Colors.black.withAlpha(128),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return MyText(
      text: "Tap and speak",
      size: 32.sp,
      weight: FontWeight.w500,
      fontFamily: AppFonts.lexend,
      letterSpacing: -1.60,
    );
  }

  Widget _buildExampleTexts() {
    return MyText(
      text:
          '"Add 2 onions, bacon, and a can of tomatoes"\n'
          '"Olive oil, the one with the red label"\n'
          '"We\'re out of diapers"',
      color: Colors.black.withAlpha(128),
      size: 14.sp,
      weight: FontWeight.w300,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildMicrophoneButton() {
    return GestureDetector(
      onTap: _toggleRecording,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(50),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: CommonImageView(imagePath: Assets.imagesMic, height: 100),
      ),
    );
  }

  Widget _buildDividerWithOr() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 0.5,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.50,
                  color: Colors.black.withAlpha(100),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Or',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black.withAlpha(100),
              fontSize: 12,
              fontFamily: AppFonts.inter,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 0.5,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.50,
                  color: Colors.black.withAlpha(100),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextInput() {
    return MyTextField(
      controller: _textController,
      hint: "Type here...",
      suffix: GestureDetector(
        onTap: _onSubmitText,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Icon(Icons.arrow_forward, color: Colors.grey),
        ),
      ),
      radius: 25,
      filledColor: kSecondary2Color,
      marginBottom: 0,
    );
  }
}
