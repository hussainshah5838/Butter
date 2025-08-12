import 'package:butter/config/constants/app_colors.dart';
import 'package:butter/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/bottom_sheets/drawer_view_sheet/drawer_view_sheet.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNewSection(),
                    SizedBox(height: 40.h),
                    _buildYesterdaySection(),
                    SizedBox(height: 40.h),
                    _buildLast7DaysSection(),
                    SizedBox(height: 40.h),
                    _buildLast30DaysSection(),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, size: 24.sp, color: Colors.black87),
        ),
      ),
    );
  }

  Widget _buildNewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'New',
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 20.h),
        _buildActivityItem(
          'Rob made changes to diapers',
          '1m',
          hasIndicator: true,
        ),
        _buildActivityItem(
          'Rob deleted oat milk from the list',
          '3m',
          hasIndicator: true,
        ),
        _buildActivityItem(
          'Rob renamed milk to oat milk',
          '59m',
          hasIndicator: true,
        ),
        _buildActivityItem(
          'Rob added milk to the list',
          '6h',
          hasIndicator: true,
        ),
      ],
    );
  }

  Widget _buildYesterdaySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(text: "Yesterday", size: 28.sp, weight: FontWeight.bold),
        // Text(
        //   'Yesterday',
        //   style: TextStyle(
        //     fontSize: 28.sp,
        //     fontWeight: FontWeight.bold,
        //     color: Colors.black87,
        //   ),
        // ),
        SizedBox(height: 20.h),
        _buildActivityItemWithAction(
          'You sorted 2 items',
          '1d',
          actionText: 'View',
        ),
      ],
    );
  }

  Widget _buildLast7DaysSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(text: "Last 7 days", size: 28.sp, weight: FontWeight.bold),
        SizedBox(height: 20.h),
        _buildActivityItemWithAction(
          'Rob sorted 15 items',
          '1d',
          actionText: 'View',
        ),
        _buildActivityItem('Rob added the category Pets', '6d'),
        _buildActivityItem('Rob renamed Pantry to Pantry Items', '6d'),
      ],
    );
  }

  Widget _buildLast30DaysSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(text: "Last 30 days", size: 28.sp, weight: FontWeight.bold),
        SizedBox(height: 20.h),
        _buildActivityItem('Rob renamed the household to Cheerio', '1 min ago'),
        _buildActivityItem('Rob joined the household', '1 min ago'),
        _buildActivityItem('Rob left the household', '1 min ago'),
      ],
    );
  }

  Widget _buildActivityItem(
    String title,
    String timeAgo, {
    bool hasIndicator = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Color(0xFFFFF3C4), // Light yellow background
              shape: BoxShape.circle,
            ),
            child: Center(
              child: MyText(
                text: 'R',
                size: 16.sp,
                weight: FontWeight.w600,
                color: Colors.orange.shade700,
              ),
            ),
          ),

          SizedBox(width: 12.w),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black87,
                      height: 1.3,
                    ),
                    children: _buildActivityTextSpans(title),
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  timeAgo,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          // Indicator dot
          if (hasIndicator)
            Container(
              width: 8.w,
              height: 8.h,
              decoration: BoxDecoration(
                color: kYellowColor,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildActivityItemWithAction(
    String title,
    String timeAgo, {
    required String actionText,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          // Avatar (You)
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Color(0xFFFFF3C4),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: MyText(
                text: 'Y',
                size: 16.sp,
                weight: FontWeight.w600,
                color: Colors.orange.shade700,
              ),
            ),
          ),

          SizedBox(width: 12.w),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black87,
                      height: 1.3,
                    ),
                    children: _buildActivityTextSpans(title),
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  timeAgo,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          // Action button
          GestureDetector(
            onTap: () => DrawerViewSheet.show(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                border: Border.all(color: kYellowColor, width: 1.5),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: MyText(
                text: actionText,
                size: 14.sp,
                weight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<TextSpan> _buildActivityTextSpans(String text) {
    // This method handles highlighting important words in the activity text
    List<TextSpan> spans = [];

    // Keywords to highlight
    final keywords = [
      'diapers',
      'oat milk',
      'milk',
      'list',
      'changes',
      'deleted',
      'renamed',
      'added',
      'sorted',
      'items',
      'category',
      'Pets',
      'Pantry',
      'Pantry Items',
      'household',
      'Cheerio',
      'joined',
      'left',
    ];

    List<String> words = text.split(' ');

    for (int i = 0; i < words.length; i++) {
      String word = words[i];
      bool isKeyword = keywords.any(
        (keyword) => word.toLowerCase().contains(keyword.toLowerCase()),
      );

      spans.add(
        TextSpan(
          text: word + (i < words.length - 1 ? ' ' : ''),
          style: TextStyle(
            fontWeight: isKeyword ? FontWeight.w600 : FontWeight.normal,
            color: isKeyword ? Colors.black : Colors.black87,
          ),
        ),
      );
    }

    return spans;
  }
}
