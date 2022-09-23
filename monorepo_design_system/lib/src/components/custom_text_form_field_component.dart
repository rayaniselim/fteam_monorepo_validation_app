import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';

class CustomTextFormFieldComponent extends StatelessWidget {
  final Icon? prefixIcon;
  final String? initialValue;
  final IconData? icon;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final bool? errorStatus;
  final Function? onTap;
  final void Function(String) onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? maxLength;
  final String? Function(String?)? validator;
  final void Function()? onTapSuffixIcon;
  final String label;
  final String hintText;

  const CustomTextFormFieldComponent({
    super.key,
    this.prefixIcon,
    this.initialValue,
    this.icon,
    required this.textInputAction,
    this.contentPadding,
    this.errorStatus = false,
    this.onTap,
    required this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.maxLines,
    this.maxLength,
    required this.validator,
    this.onTapSuffixIcon,
    required this.label,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
              child: Text(
                label,
                style: AppFontTheme.appTextLabel,
              ),
            ),
            TextFormField(
              initialValue: initialValue ?? '',
              textCapitalization: TextCapitalization.words, // letra maiuscula
              cursorColor: AppColors.colorsHintText,
              style: AppFontTheme.appTextHint,
              keyboardType: TextInputType.name,
              autocorrect: false,
              validator: (value) => validator!(value!),
              onChanged: (value) {
                onChanged(value);
              },
              textInputAction: textInputAction,
              maxLines: 1,
              decoration: InputDecoration(
                contentPadding: contentPadding ??
                    const EdgeInsets.only(
                      top: 16,
                      left: 16,
                      right: 0,
                      bottom: 16,
                    ),
                prefixIcon: Icon(
                  icon,
                  color: Theme.of(context).iconTheme.color,
                  size: 24,
                ),
                hintText: hintText,
                hintStyle: AppFontTheme.appTextHint,
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 0.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1.5,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    color: Theme.of(context).errorColor,
                    width: 1,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    color: Theme.of(context).errorColor,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
