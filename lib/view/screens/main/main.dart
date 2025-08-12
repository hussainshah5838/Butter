import 'package:butter/config/constants/app_colors.dart';
import 'package:butter/config/routes/routes_name.dart';
import 'package:butter/view/screens/list/list_screen.dart';
import 'package:butter/view/widget/bottom_sheets/add_sheet/add_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../drawer_screen/drawer_screen.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  RxInt selectedIndex = 0.obs;

  void selectedIndexChange(int index) {
    if (index == selectedIndex.value) return;
    selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _appbar(),
      drawer: const DrawerScreen(),
      body: _bodyContent(),
      floatingActionButton: _floatingActionButtonContent(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _bottomNavBarContent(),
    );
  }

  _appbar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu, size: 30.sp),
        onPressed: () => _scaffoldKey.currentState?.openDrawer(),
      ),
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
        return SizedBox.shrink();
      } else {
        return Center(child: Text('Unknown View'));
      }
    });
  }

  _bottomNavBarContent() {
    return Obx(() {
      return BottomNavigationBar(
        currentIndex: selectedIndex.value,
        onTap: (index) {
          if (index == 1) {
            Get.toNamed(RouteName.margeScreen);
          } else {
            selectedIndexChange(index);
          }
        },
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
      );
    });
  }
}
