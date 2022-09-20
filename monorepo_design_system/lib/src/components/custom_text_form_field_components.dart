import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';

class CustomTextFormFieldComponents extends StatefulWidget {
  final Icon? prefixIcon;
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

  const CustomTextFormFieldComponents({
    super.key,
    this.prefixIcon,
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
  State<CustomTextFormFieldComponents> createState() =>
      _CustomTextFormFieldComponentsState();
}

class _CustomTextFormFieldComponentsState
    extends State<CustomTextFormFieldComponents> {
  bool focused = false;

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
                widget.label,
                style: AppFontSize.appFontSizeTextLabel.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextFormField(
              textCapitalization: TextCapitalization.words, // letra maiuscula
              cursorColor: AppColors.colorsTextFormField,
              style: AppFontSize.appFontSizeTextHint.copyWith(
                fontWeight: FontWeight.normal,
                color: AppColors.colorsTextFormField,
              ),
              keyboardType: TextInputType.name,

              autocorrect: false,
              validator: (value) => widget.validator!(value!),
              onChanged: (value) => widget.onChanged(value),
              textInputAction: widget.textInputAction,
              maxLines: 1,
              decoration: InputDecoration(
                contentPadding: widget.contentPadding ??
                    const EdgeInsets.only(
                      top: 16,
                      left: 16,
                      right: 0,
                      bottom: 16,
                    ),
                prefixIcon: Icon(
                  widget.icon,
                  color: AppColors.primaryColor,
                  size: 24,
                ),
                hintText: widget.hintText,
                hintStyle: AppFontSize.appFontSizeTextHint.copyWith(
                  fontWeight: FontWeight.normal,
                  color: AppColors.colorsTextFormField,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                    width: 0.5,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                    width: 1.5,
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    color: AppColors.colorsError,
                    width: 1,
                  ),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide:
                      BorderSide(color: AppColors.colorsError, width: 1.5),
                ),
              ),
              // inputFormatters: widget.inputFormatters, // formatar o texto
            ),
          ],
        ),
      ),
    );
  }
}
