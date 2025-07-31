import 'package:butter/config/constants/app_colors.dart';
import 'package:butter/view/screens/list/list_screen.dart';
import 'package:butter/view/widget/bottom_sheets/add_sheet/add_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../marge_screens/marge_screen.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  RxInt selectedIndex = 0.obs;

  void selectedIndexChange(int index) {
    if (index == selectedIndex.value) return;
    selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, size: 30.sp),
          onPressed: () {},
        ),
      ),
      body: _bodyContent(),
      floatingActionButton: _floatingActionButtonContent(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _bottomNavBarContent(),
    );
  }

  _floatingActionButtonContent() {
    return FloatingActionButton(
      onPressed: () => AddSheet.show(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Icon(Icons.add, size: 30.sp, color: kWhiteColor),
    );
  }

  _bodyContent() {
    return Obx(() {
      if (selectedIndex.value == 0) {
        return HomeScreen();
      } else if (selectedIndex.value == 1) {
        return MargeScreen();
      } else {
        return Center(child: Text('Unknown View'));
      }
    });
  }

  _bottomNavBarContent() {
    return Obx(() {
      return SizedBox(
        height: 0.1.sh,
        child: BottomNavigationBar(
          currentIndex: selectedIndex.value,
          onTap: (index) => selectedIndexChange(index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.checklist_rtl_outlined),
              label: 'List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.messenger_outline_rounded),
              label: 'Marge',
            ),
          ],
        ),
      );
    });
  }
}
