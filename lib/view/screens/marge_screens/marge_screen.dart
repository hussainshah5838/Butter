import 'package:flutter/material.dart';

class MargeScreen extends StatefulWidget {
  const MargeScreen({super.key});

  @override
  State<MargeScreen> createState() => _MargeScreenState();
}

class _MargeScreenState extends State<MargeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFEAA3), Color(0xffFFFCF3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: _bodycontent(),
      ),
    );
  }

  _bodycontent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wb_twilight_rounded, size: 64, color: Colors.grey[400]),
          SizedBox(height: 16),
          Text(
            "No items",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Lexend',
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Enjoy the serenity of an empty list.\nMarge is impressed. Temporarily.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
