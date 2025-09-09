import 'package:butter/view/widget/custom_appbar.dart';
import 'package:flutter/material.dart';



class HouseHoldScreen extends StatelessWidget {
  const HouseHoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "",
        actions: [
          Icon(Icons.more_horiz_outlined),
          SizedBox(width: 10,),
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
