import 'package:flutter/material.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.colorsBackgroundGrey,
      elevation: 0,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_sharp,
          color: AppColors.colorsIconAppBar,
          size: 28,
        ),
      ),
    );
  }
}
