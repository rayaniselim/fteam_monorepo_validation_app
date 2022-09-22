import 'package:flutter/material.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';
import 'package:core_module/core_module.dart';
import 'components/text_header_cadastre_component.dart';

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
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const TextHeaderCadestreComponent(),
            Container(
              decoration: const BoxDecoration(
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
                          CustomTextFormFieldComponent(
                            label: 'Full Name',
                            hintText: '  Enter your full name',
                            textInputAction: TextInputAction.next,
                            icon: Icons.person_outline,
                            onChanged: (value) => _userName = value,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp('[a-z A-Z]').hasMatch(value)) {
                                return 'Enter correct name';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          CustomTextFormFieldComponent(
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
                          TextFormFieldPassword(
                            label: 'Password',
                            hintText: '  Password',
                            onChanged: (value) => _password = value,
                            validator: (value) => Validators.passwordValidate(
                              password: value,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          TextFormFieldPassword(
                            label: 'Confirm Password',
                            hintText: '  Confirm Password',
                            onChanged: (value) => _confirmPassword = value,
                            validator: (value) =>
                                Validators.confirmPasswordValidate(
                              confirmPassword: value,
                              password: _password,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () {
                              _trySubmitForm();
                            },
                            child: const BottomComponent(
                              textTitle: 'Sign Up',
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
