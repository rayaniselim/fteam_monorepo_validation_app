import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';
import 'package:core_module/core_module.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: true,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 52),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomHeaderComponent(
              title: '👋 Hello,\nAre you new here?',
              subtitle: 'If you have an account ',
              textAction: '/Login',
              recognizer: TapGestureRecognizer()
                ..onTap = () => {
                      Navigator.pushNamed(context, '/login'),
                    },
            ),
            CustomCardComponent(
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
                      CustomTextFormFieldPassword(
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
                      CustomTextFormFieldPassword(
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
                        height: 80,
                      ),
                      CustomButtonComponent(
                        onTap: () {
                          _trySubmitForm();
                        },
                        textTitle: 'Sign Up',
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                    ],
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
