import 'package:flutter/material.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';

class BottomComponent extends StatelessWidget {
  final String textTitle;
  const BottomComponent({
    super.key,
    required this.textTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text(
        textTitle,
        style: AppFontSize.appFontSizeTextButton.copyWith(
          color: AppColors.colorsTextWhite,
        ),
      ),
    );
  }
}
