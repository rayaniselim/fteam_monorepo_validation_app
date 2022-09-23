import 'package:flutter/material.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';

class BottomComponent extends StatelessWidget {
  final String textTitle;
  final void Function()? onTap;
  const BottomComponent({
    super.key,
    required this.textTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 330,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          textTitle,
          style: AppFontTheme.appTextButton,
        ),
      ),
    );
  }
}
