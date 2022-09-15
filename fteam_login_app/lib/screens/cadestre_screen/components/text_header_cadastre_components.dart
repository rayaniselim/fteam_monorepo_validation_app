import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';

class TextHeaderCadestreComponents extends StatefulWidget {
  const TextHeaderCadestreComponents({super.key});

  @override
  State<TextHeaderCadestreComponents> createState() =>
      _TextHeaderCadestreComponentsState();
}

class _TextHeaderCadestreComponentsState
    extends State<TextHeaderCadestreComponents> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.colorsBackgroundGrey,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          top: 8,
          right: 24,
          bottom: 34,
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
                      style: AppFontSize.appFontSizeTextTitleHeader.copyWith(
                        color: AppColors.colorsTextBold,
                        fontWeight: FontWeight.bold,
                      ),
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
                  style: AppFontSize.appFontSizeTextTitleHeader.copyWith(
                    color: AppColors.colorsTextBold,
                    fontWeight: FontWeight.bold,
                  ),
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
                            style: AppFontSize.appFontSizeTextHeaderSubtitle
                                .copyWith(
                              color: AppColors.colorsTextGreyHeader,
                            ),
                          ),
                          TextSpan(
                            text: 'Login',
                            style: AppFontSize.appFontSizeTextHeaderSubtitle
                                .copyWith(
                              color: AppColors.colorsTextLogin,
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
