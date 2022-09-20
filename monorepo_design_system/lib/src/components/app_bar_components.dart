import 'package:flutter/material.dart';

import '../../monorepo_design_system.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.colorsBackgroundGrey,
        resizeToAvoidBottomInset: true,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              elevation: 0,
              backgroundColor: AppColors.colorsBackgroundGrey,
              scrolledUnderElevation: 10,
            ),
          ],
        )
        //  leading: InkWell(
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //   child: const Icon(
        //     Icons.arrow_back_sharp,
        //     color: AppColors.colorsIconAppBar,
        //     size: 28,
        //   ),
        // ),
        // ),

        );
  }
}
