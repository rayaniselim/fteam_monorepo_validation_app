import 'package:flutter/material.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';

class CustomCardComponent extends StatelessWidget {
  final Widget child;
  const CustomCardComponent({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.colorsBackgroundWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: child,
    );
  }
}
