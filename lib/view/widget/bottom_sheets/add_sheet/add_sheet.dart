import 'package:butter/config/constants/app_colors.dart';
import 'package:butter/config/constants/app_fonts.dart';
import 'package:butter/view/widget/common_image_view_widget.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:butter/view/widget/my_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../generated/assets.dart';

class AddSheet extends StatefulWidget {
  static void show() {
    Get.bottomSheet(
      const AddSheet(),
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
    );
  }

  const AddSheet({super.key});

  @override
  State<AddSheet> createState() => _AddSheetState();
}

class _AddSheetState extends State<AddSheet> with TickerProviderStateMixin {
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

  void _onSubmitText() {
    if (_textController.text.trim().isNotEmpty) {
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      margin: EdgeInsets.only(top: 0.1.sh),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Header with close button
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.close, color: kBlackColor, size: 24.sp),
          ),

          // Main content
          Expanded(
            child: Obx(
              () =>
                  isRecording.value
                      ? _buildListeningView()
                      : _buildRecordingView(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecordingView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),

        // Title
        MyText(
          text: "Tap and speak",
          size: 28.sp,
          weight: FontWeight.w500,
          fontFamily: AppFonts.lexend,
          letterSpacing: -1.60,
        ),

        15.verticalSpace,

        // Example texts
        MyText(
          text:
              '"Add 2 onions, bacon, and a can of tomatoes"\n'
              '"Olive oil, the one with the red label"\n'
              '"We\'re out of diapers"',
          color: Colors.black.withAlpha(128),
          size: 14.sp,
          weight: FontWeight.w300,
          textAlign: TextAlign.center,
        ),

        const Spacer(),

        // Microphone button
        GestureDetector(
          onTap: _toggleRecording,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(50),
                  blurRadius: 10.r,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: CommonImageView(imagePath: Assets.imagesMic, height: 80.h),
          ),
        ),

        const Spacer(),

        // Divider with "Or"
        Row(
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
        ),

        20.verticalSpace,

        // Text input
        MyTextField(
          controller: _textController,
          hint: "Type here...",
          suffix: GestureDetector(
            onTap: _onSubmitText,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Icon(Icons.arrow_forward, color: Colors.grey),
            ),
          ),
          radius: 25.r,
          filledColor: kSecondary2Color,
          marginBottom: 0,
        ),

        // Bottom safe area
        SizedBox(height: MediaQuery.of(context).padding.bottom),
      ],
    );
  }

  Widget _buildListeningView() {
    return Column(
      children: [
        Row(),
        const Spacer(),
        const Spacer(),

        // Animated sound waves
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

        // Stop button
        GestureDetector(
          onTap: _toggleRecording,
          child: CommonImageView(svgPath: Assets.svgStop),
        ),

        const Spacer(),
        const Spacer(),
      ],
    );
  }
}
