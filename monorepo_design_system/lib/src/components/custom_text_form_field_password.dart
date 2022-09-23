import 'package:flutter/material.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';

class CustomTextFormFieldPassword extends StatefulWidget {
  final String label;
  final String? initialValue;
  final String hintText;
  final IconData? icon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String) onChanged;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final void Function()? onTapSuffixIcon;

  const CustomTextFormFieldPassword({
    super.key,
    required this.label,
    this.initialValue,
    required this.hintText,
    this.icon,
    this.obscureText,
    this.keyboardType,
    this.validator,
    required this.onChanged,
    this.textInputAction,
    this.contentPadding,
    this.prefixIcon,
    this.suffixIcon,
    this.onTapSuffixIcon,
  });

  @override
  State<CustomTextFormFieldPassword> createState() =>
      _CustomTextFormFieldPasswordState();
}

class _CustomTextFormFieldPasswordState
    extends State<CustomTextFormFieldPassword> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.label,
              style: AppFontTheme.appTextLabel,
            ),
            const SizedBox(
              height: 22,
            ),
            TextFormField(
              initialValue: widget.initialValue ?? '',
              obscureText: isObscure,
              cursorColor: AppColors.colorsHintText,
              style: AppFontTheme.appTextHint,
              keyboardType: TextInputType.name,
              autocorrect: false,
              validator: (value) => widget.validator!(value!),
              onChanged: (value) => widget.onChanged(value),
              textInputAction: TextInputAction.next,
              maxLines: 1,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 0,
                  bottom: 16,
                ),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: Theme.of(context).primaryColor,
                  size: 24,
                ),
                suffixIcon: GestureDetector(
                  child: isObscure == true
                      ? const Icon(
                          Icons.visibility_off_outlined,
                          color: AppColors.colorsIconGrey,
                          size: 24,
                        )
                      : const Icon(
                          Icons.visibility_outlined,
                          color: AppColors.colorsIconGrey,
                          size: 24,
                        ),
                  onTap: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                ),
                hintText: widget.hintText,
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
