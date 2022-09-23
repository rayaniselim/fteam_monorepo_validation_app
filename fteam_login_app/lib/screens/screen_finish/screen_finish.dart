import 'package:flutter/material.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';

class ScreenFinish extends StatelessWidget {
  const ScreenFinish({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 52),
        child: CustomAppBar(),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(),
        child: const Text(
          ' finish !',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
