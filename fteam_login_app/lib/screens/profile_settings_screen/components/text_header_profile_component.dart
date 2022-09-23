import 'package:flutter/material.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';

class TextHeaderProfileComponent extends StatefulWidget {
  const TextHeaderProfileComponent({super.key});

  @override
  State<TextHeaderProfileComponent> createState() =>
      _TextHeaderProfileComponentState();
}

class _TextHeaderProfileComponentState
    extends State<TextHeaderProfileComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 32,
          left: 24,
          right: 24,
          bottom: 32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  ' 😎 Setting up your',
                  style: AppFontTheme.appTextTitleHeader,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              ' profile',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppFontTheme.appTextTitleHeader,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Add your profile photo',
                        style: AppFontTheme.appTextHeaderSubtitle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
