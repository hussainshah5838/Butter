import 'package:butter/config/constants/app_colors.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/marge_controller.dart';
import '../../widget/ai_thinker_loader/ai_thinker_loader.dart';

class MargeScreen extends StatefulWidget {
  const MargeScreen({super.key});

  @override
  State<MargeScreen> createState() => _MargeScreenState();
}

class _MargeScreenState extends State<MargeScreen>
    with TickerProviderStateMixin {
  final margeController = Get.put(MargeController());
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationActivity();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _animationActivity() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
    Future.delayed(Duration(milliseconds: 1500), () {
      margeController.startConversation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFEAA3), Color(0xffFFFCF3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: _bodyContent(),
      ),
    );
  }

  _bodyContent() {
    return SafeArea(
      child: Column(
        children: [
          // Header
          _buildHeader(),

          // Chat Content
          Expanded(child: Obx(() => _buildChatContent())),

          // Input Area
          Obx(() => _buildInputArea()),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: () => Get.back(),
        child: Icon(Icons.close, size: 24.sp, color: Colors.black54),
      ),
    );
  }

  Widget _buildChatContent() {
    if (margeController.currentStep.value == ConversationStep.initial) {
      return AiThinkerLoader();
    }

    return Column(
      children: [
        // Messages
        Expanded(
          child: ListView.builder(
            controller: margeController.scrollController,
            itemCount: margeController.messages.length,
            itemBuilder: (context, index) {
              final message = margeController.messages[index];
              return _buildMessageBubble(message);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(vertical: 0.h),
      child: Column(
        crossAxisAlignment:
            message.isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // if (!message.isUser) _buildMargeHeader(),
          Container(
            // constraints: BoxConstraints(maxWidth: 0.75.sw),
            padding: EdgeInsets.all(16.w),
            child: _buildMessageContent(message),
          ),
        ],
      ),
    );
  }

  // Widget _buildMargeHeader() {
  //   return Padding(
  //     padding: EdgeInsets.only(bottom: 4.h, left: 4.w),
  //     child: Row(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Text(
  //           "I'm Marge ",
  //           style: TextStyle(
  //             fontSize: 14.sp,
  //             fontWeight: FontWeight.w600,
  //             color: Colors.black87,
  //           ),
  //         ),
  //         Text('👩‍🍳', style: TextStyle(fontSize: 14.sp)),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildMessageContent(ChatMessage message) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!message.isTyping)
          Text(
            message.text,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black87,
              height: 1.4,
            ),
          ),
        if (message.isTyping) ...[SizedBox(height: 8.h), AiThinkerLoader()],
      ],
    );
  }

  Widget _buildInputArea() {
    if (margeController.currentStep.value == ConversationStep.initial ||
        margeController.currentStep.value == ConversationStep.thinking ||
        margeController.currentStep.value == ConversationStep.greeting) {
      return SizedBox.shrink();
    }

    return Column(
      children: [
        if (margeController.inputMode.value == InputMode.text)
          _buildTextInput()
        else if (margeController.inputMode.value == InputMode.voice)
          _buildVoiceInput(),
      ],
    );
  }

  Widget _buildTextInput() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(25.r),
              boxShadow: [
                BoxShadow(
                  color: kGreyTxColor,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: TextField(
              controller: margeController.textController,
              minLines: 1,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: 'Spill the beans...',
                hintStyle: TextStyle(color: Colors.black45, fontSize: 14.sp),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 12.h,
                ),
              ),
              onSubmitted: (value) => margeController.sendMessage(value),
            ),
          ),
        ),
        GestureDetector(
          onLongPress: () => margeController.toggleInputMode(),
          onTap:
              () => margeController.sendMessage(
                margeController.textController.text,
              ),
          child: Container(
            margin: EdgeInsets.all(4.w),
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Color(0xFFFFD54F),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.arrow_upward, color: Colors.black87, size: 20.sp),
          ),
        ),
      ],
    );
  }

  Widget _buildVoiceInput() {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Obx(
              () =>
                  margeController.isRecording.value
                      ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.mic, color: Colors.red, size: 20.sp),
                          SizedBox(width: 8.w),
                          Text(
                            'Recording...',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                      : MyText(text: ""),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => margeController.toggleRecording(),
          child: Container(
            margin: EdgeInsets.all(4.w),
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color:
                  margeController.isRecording.value
                      ? Colors.red
                      : Colors.black87,
              shape: BoxShape.circle,
            ),
            child: Icon(
              margeController.isRecording.value ? Icons.stop : Icons.mic,
              color: Colors.white,
              size: 20.sp,
            ),
          ),
        ),
      ],
    );
  }
}
