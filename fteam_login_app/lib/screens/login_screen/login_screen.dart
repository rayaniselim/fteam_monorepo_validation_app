import 'package:flutter/material.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';
import 'components/forgot_my_password_component.dart';
import 'components/text_button_create_component.dart';

final formKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _userEmail = '';
  String _password = '';

  bool isPasswordObscure = true;

  void _trySubmitForm() {
    final bool? isValid = formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);
      debugPrint(_password);
      Navigator.pushNamed(context, '/profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorsBackgroundWhite,
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    CustomTextFormFieldComponent(
                      label: 'Email',
                      hintText: '  Email',
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      icon: Icons.email_outlined,
                      onChanged: (value) {
                        formKey.currentState?.validate();
                        _userEmail = value;
                      },
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your email address';
                        }
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          /// comeca com string e aceita quantos caracteres necessario S+ em 3 grupos
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
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 0,
                      ),
                      child: ForgotMyPasswordComponent(),
                    ),
                    const SizedBox(height: 40),
                    InkWell(
                      onTap: () {
                        _trySubmitForm();
                      },
                      child: const BottomComponent(
                        textTitle: 'Sign Up',
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TextButtonCreateComponent(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
