import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';

class ForgotMyPasswordComponents extends StatelessWidget {
  const ForgotMyPasswordComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            text: 'forgot my password',
            style: AppFontSize.appFontSizeTextLogin.copyWith(
              fontSize: 14,
              color: AppColors.colorsTextLogin,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, '/finish');
              },
          ),
        ),
      ],
    );
  }
}
