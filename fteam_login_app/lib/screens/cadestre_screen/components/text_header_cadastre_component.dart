import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';

class TextHeaderCadestreComponent extends StatefulWidget {
  const TextHeaderCadestreComponent({super.key});

  @override
  State<TextHeaderCadestreComponent> createState() =>
      _TextHeaderCadestreComponentState();
}

class _TextHeaderCadestreComponentState
    extends State<TextHeaderCadestreComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.colorsBackgroundGrey,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 32,
          left: 24,
          right: 24,
          bottom: 32,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      ' 👋 Hello,',
                      maxLines: 2,
                      style: AppFontTheme.appTextTitleHeader,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Are you new here?',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppFontTheme.appTextTitleHeader,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'if you have an account /',
                              style: AppFontTheme.appTextHeaderSubtitle),
                          TextSpan(
                            text: 'Login',
                            style: AppFontTheme.appTextHeaderSubtitle.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => {
                                    Navigator.pushNamed(context, '/login'),
                                  },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
