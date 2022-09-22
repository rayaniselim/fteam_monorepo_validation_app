import 'package:flutter/material.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';

class ScreenFinish extends StatelessWidget {
  const ScreenFinish({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: CustomAppBar(),
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
