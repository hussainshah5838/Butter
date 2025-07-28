import 'package:butter/config/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
      body: _bodyContent(),
      floatingActionButton: _floatingActionButtonContent(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _bottomNavBarContent(),
    );
  }

  _floatingActionButtonContent() {
    return FloatingActionButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Icon(Icons.add, size: 30.sp, color: kWhiteColor),
    );
  }

  _bodyContent() {
    return Obx(() {
      if (selectedIndex.value == 0) {
        return Center(child: Text('List View'));
      } else if (selectedIndex.value == 1) {
        return Center(child: Text('Marge View'));
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
