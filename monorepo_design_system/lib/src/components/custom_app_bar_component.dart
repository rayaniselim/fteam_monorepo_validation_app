import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 52,
      leading: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          top: 20,
        ),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_sharp,
            size: 28,
          ),
        ),
      ),
    );
  }
}
