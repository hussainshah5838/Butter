import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';
import '../../../generated/assets.dart';
import '../../widget/common_image_view_widget.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/drawer.dart';
import '../../widget/my_text_widget.dart';
import '../home/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  final int initialIndex;
  const BottomNavBar({Key? key, this.initialIndex = 0}) : super(key: key);
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late List<Map<String, dynamic>> items;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    updateItems();
  }


  void updateItems() {
    items = [
      {
        'image': Assets.imagesList,
        'label': 'List'.tr,
      },

      {
        'image': Assets.imagesAdd,
        'label': ''.tr,
      },
      {
        'image':  Assets.imagesChat ,
        'label': 'Marge'.tr,
      },

    ];
  }

  final List<Widget> screens = [

    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    //AlertScreen(),

  ];

  String? _scanResult = "No result yet";
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar3(
        onDrawerPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
      ),
      drawer: CustomDrawer(
        onItemSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(0),
        //height:  62,
        decoration: const BoxDecoration(
         color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x1E000000),
              blurRadius: 20,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ],
        ),
        child: BottomNavigationBar(

          elevation: 0,
          backgroundColor: Colors.transparent,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              log(currentIndex.toString());
              updateItems(); // Update items when index changes
            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedLabelStyle: TextStyle(
            fontFamily: AppFonts.inter,
            color: kYellowColor,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: AppFonts.inter,
            color: kYellowColor,
          ),
          selectedItemColor: kYellowColor,
          unselectedItemColor: kYellowColor,
          items: List.generate(
            items.length,
                (index) {
              return BottomNavigationBarItem(

                tooltip: 'ss',
                activeIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    index ==  1 ?
                    Image.asset(
                      items[index]['image'],
                      width: 55,
                    ) :
                    Image.asset(
                      items[index]['image'],
                      color: kBlackColor,
                      width: 27,
                    ),
                    if(index != 1)
                    const SizedBox(height: 2),
                    if(index != 1)// Space between icon and dot
                    MyText(
                      text: items[index]['label'],
                      size: 12,
                      weight: FontWeight.w500,
                      color: kBlackColor,
                    )
                  ],
                ),
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    index == 1 ?
                    Image.asset(
                      items[index]['image'],
                      width: 55,
                    ) : Image.asset(
                      items[index]['image'],
                      color: kTertiaryColor,
                      width: 27,
                    ) ,
                    if(index != 1)
                    const SizedBox(height: 2),
                    if(index != 1)// Space between icon and dot
                    MyText(
                      text: items[index]['label'],
                      size: 12,
                      weight: FontWeight.w500,
                      color: kTertiaryColor,
                    )
                  ],
                ),
                label: '',
              );
            },
          ),
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      /*floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? res = await SimpleBarcodeScanner.scanBarcode(
            context,
            barcodeAppBar: const BarcodeAppBar(
              appBarTitle: 'Scan Ticket',
              centerTitle: true,
              enableBackButton: true,
              backButtonIcon: Icon(Icons.arrow_back),
            ),
            isShowFlashIcon: true, // Show flash icon
            delayMillis: 2000,     // Scanning delay
            cameraFace: CameraFace.back, // Use back camera
          );

          if (res != null && res.isNotEmpty) {
            // Update the scanned result
            _scanResult = res;
            // Navigate to the next screen
            Get.back();
          } else {
            // Handle empty or canceled scan
            Get.snackbar(
              'Error',
              'No barcode found!',
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        },
        backgroundColor: kYellowColor,
        shape: CircleBorder(),
        child: CommonImageView(svgPath: Assets.svgBxQr,),
      ),*/
    );
  }
}







