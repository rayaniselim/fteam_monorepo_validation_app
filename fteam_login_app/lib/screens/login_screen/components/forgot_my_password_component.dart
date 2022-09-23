import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';

class ForgotMyPasswordComponent extends StatelessWidget {
  final void Function()? onTap;
  const ForgotMyPasswordComponent({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
              text: 'forgot my password',
              style: AppFontTheme.appTextLogin,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, '/finish');
                },
            ),
          ),
        ],
      ),
    );
  }
}
