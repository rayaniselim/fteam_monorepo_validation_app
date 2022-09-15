import 'package:flutter/material.dart';

class ScreenFinish extends StatelessWidget {
  const ScreenFinish({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.pink[100],
        ),
        // height: 400,
        // width: 400,
        child: Text(
          ' finish !',
          style: TextStyle(
            fontSize: 30,
            color: Colors.grey[800],
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
