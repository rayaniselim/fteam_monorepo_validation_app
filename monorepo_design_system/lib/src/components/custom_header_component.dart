import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';

class CustomHeaderComponent extends StatefulWidget {
  final String title;
  final String subtitle;
  final String? textAction;
  final GestureRecognizer? recognizer;

  const CustomHeaderComponent({
    super.key,
    required this.title,
    required this.subtitle,
    this.textAction,
    this.recognizer,
  });

  @override
  State<CustomHeaderComponent> createState() => _CustomHeaderComponentState();
}

class _CustomHeaderComponentState extends State<CustomHeaderComponent> {
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
                      widget.title,
                      maxLines: 2,
                      style: AppFontTheme.appTextTitleHeader,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: widget.subtitle,
                              style: AppFontTheme.appTextHeaderSubtitle),
                          TextSpan(
                            text: widget.textAction,
                            style: AppFontTheme.appTextHeaderSubtitle.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                            recognizer: widget.recognizer,
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
