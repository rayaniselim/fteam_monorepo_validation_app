// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:monorepo_design_system/monorepo_design_system.dart';

// class CustomHeaderComponent extends StatefulWidget {
//   final String title1;
//   final String title2;
//   final String subtitle1;
//   final String subtitle2;
//   const CustomHeaderComponent(
//       {super.key,
//       required this.title1,
//       required this.title2,
//       required this.subtitle1,
//       required this.subtitle2});

//   @override
//   State<CustomHeaderComponent> createState() => _CustomHeaderComponentState();
// }

// class _CustomHeaderComponentState extends State<CustomHeaderComponent> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppColors.colorsBackgroundGrey,
//       child: Padding(
//         padding: const EdgeInsets.only(
//           top: 32,
//           left: 24,
//           right: 24,
//           bottom: 32,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       widget.title1,
//                       maxLines: 2,
//                       style: AppFontTheme.appTextTitleHeader,
//                       textAlign: TextAlign.start,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   widget.title2,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: AppFontTheme.appTextTitleHeader,
//                   textAlign: TextAlign.start,
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Text.rich(
//                       TextSpan(
//                         children: [
//                           TextSpan(
//                               text: widget.subtitle1,
//                               style: AppFontTheme.appTextHeaderSubtitle),
//                           TextSpan(
//                             text: widget.subtitle2,
//                             style: AppFontTheme.appTextHeaderSubtitle.copyWith(
//                               fontWeight: FontWeight.w500,
//                             ),
//                             recognizer: TapGestureRecognizer()
//                               ..onTap = () => {
//                                     Navigator.pushNamed(context, '/login'),
//                                   },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
