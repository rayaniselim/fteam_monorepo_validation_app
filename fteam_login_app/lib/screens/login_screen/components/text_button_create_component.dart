import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';

class TextButtonCreateComponent extends StatefulWidget {
  const TextButtonCreateComponent({super.key});

  @override
  State<TextButtonCreateComponent> createState() =>
      _TextButtonCreateComponentState();
}

class _TextButtonCreateComponentState extends State<TextButtonCreateComponent> {
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
                style: AppFontTheme.appTextLogin,
              ),
              TextSpan(
                text: ' Create',
                style: AppFontTheme.appTextLogin.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, '/signup');
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
