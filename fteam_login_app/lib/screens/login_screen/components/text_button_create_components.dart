import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';

class TextButtonCreateComponents extends StatefulWidget {
  const TextButtonCreateComponents({super.key});

  @override
  State<TextButtonCreateComponents> createState() =>
      _TextButtonCreateComponentsState();
}

class _TextButtonCreateComponentsState
    extends State<TextButtonCreateComponents> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "if you don't have an account /",
                style: AppFontSize.appFontSizeTextLogin.copyWith(
                  color: AppColors.colorsTextGreyHeader,
                ),
              ),
              TextSpan(
                text: ' Create',
                style: AppFontSize.appFontSizeTextLogin.copyWith(
                  color: AppColors.colorsTextLogin,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, '/cadestre');
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
