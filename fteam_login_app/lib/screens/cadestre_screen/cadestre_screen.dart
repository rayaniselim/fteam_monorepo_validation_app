import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';
import 'components/text_header_cadastre_components.dart';

class CadestreScreen extends StatefulWidget {
  const CadestreScreen({super.key});

  @override
  State<CadestreScreen> createState() => _CadestreScreenState();
}

class _CadestreScreenState extends State<CadestreScreen> {
  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _userName = '';
  String _password = '';
  String _confirmPassword = '';
  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;

// void nao retorna nada

  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);
      debugPrint(_userName);
      debugPrint(_password);
      debugPrint(_confirmPassword);
      Navigator.pushNamed(context, '/profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorsBackgroundGrey,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.colorsBackgroundGrey,
        elevation: 0,
        scrolledUnderElevation: 10,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_sharp,
            color: AppColors.colorsIconAppBar,
            size: 28,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const TextHeaderCadestreComponents(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: AppColors.colorsBackgroundWhite,
              ),
              alignment: Alignment.bottomCenter,
              child: Center(
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      top: 29,
                      right: 25,
                      bottom: 0,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextFormFieldComponents(
                            label: 'Full Name',
                            hintText: '  Enter your full name',
                            textInputAction: TextInputAction.next,
                            icon: Icons.person_outline,
                            onChanged: (value) => _userName = value,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'This field is required';
                              }
                              if (value.trim().length < 6) {
                                return 'Username must be at least 6 characters in length';
                              }
                              return null;
                            },
                            //   if (value!.isEmpty ||
                            //       !RegExp(r'ˆ[a-z A-Z]+$').hasMatch(value)) {
                            //     return 'Enter correct name';
                            //   } else {
                            //     return null;
                            //   }
                            // }, /// VER QUAL O LIMITE DE PALAVRAS DELE PQ NAO FUNCIONA
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          CustomTextFormFieldComponents(
                            label: 'Email',
                            hintText: '  Email',
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            icon: Icons.email_outlined,
                            onChanged: (value) => _userEmail = value,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter your email address';
                              }

                              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          CustomTextFormFieldComponents(
                            label: 'Password',
                            hintText: '  Password',
                            textInputAction: TextInputAction.next,
                            icon: Icons.lock_outline,
                            suffixIcon: isPasswordObscure == true
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
                            onTapSuffixIcon: () {
                              setState(() {
                                isPasswordObscure = !isPasswordObscure;
                              });
                            },
                            onChanged: (value) => _password = value,
                            obscureText: isPasswordObscure,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'This field is required';
                              }
                              if (value.trim().length < 6) {
                                return 'Password must be at least 6 characters in length';
                              }
                              return null;
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          CustomTextFormFieldComponents(
                            label: 'Confirm Password',
                            hintText: '  Confirm Password',
                            textInputAction: TextInputAction.done,
                            icon: Icons.lock_outline,
                            obscureText: isConfirmPasswordObscure,
                            onChanged: (value) => _confirmPassword = value,
                            suffixIcon: isConfirmPasswordObscure == true
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
                            onTapSuffixIcon: () {
                              setState(() {
                                isConfirmPasswordObscure =
                                    !isConfirmPasswordObscure;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }

                              if (value != _password) {
                                return 'Confimation password does not match the entered password';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 50),
                          InkWell(
                            onTap: () {
                              _trySubmitForm();
                            },
                            child: Container(
                              width: 255,
                              height: 60,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Sign Up ',
                                style:
                                    AppFontSize.appFontSizeTextButton.copyWith(
                                  color: AppColors.colorsTextWhite,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
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
