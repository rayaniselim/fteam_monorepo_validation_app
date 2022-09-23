import 'package:flutter/material.dart';
import 'package:fteam_firebase_login_app/screens/profile_settings_screen/components/image_profile_component.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';
import 'components/countries_dropdown_component.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _userName = '';
  String _telephone = '';

  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);
      debugPrint(_userName);
      debugPrint(_telephone);
      Navigator.pushNamed(context, '/finish');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorsBackgroundGrey,
      resizeToAvoidBottomInset: true,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 52),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const CustomHeaderComponent(
              subtitle: 'Add you profile photo',
              title: '😎 Setting up your\nprofile',
            ),
            CustomCardComponent(
              child: Column(
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  const ImageProfile(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Center(
                      child: Card(
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
                                  label: 'Display Name',
                                  hintText: '  Enter your name',
                                  textInputAction: TextInputAction.next,
                                  icon: Icons.person_outline,
                                  onChanged: (value) => _userName = value,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp('[a-z A-Z]{10}')
                                            .hasMatch(value)) {
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
                                  label: 'CPF',
                                  hintText: '  CPF',
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  icon: Icons.mode_edit_outline_outlined,
                                  onChanged: (value) => _userEmail = value,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp("[0-9]{3}[.]?[0-9]{3}[.]?[0-9]{3}[-]?[0-9]{2}")
                                            .hasMatch(value)) {
                                      return 'Enter correct cpf';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(5),
                                ),
                                CustomTextFormFieldComponent(
                                  label: 'Telephone',
                                  hintText: '  Telephone',
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  icon: Icons.phone,
                                  onChanged: (value) => _telephone = value,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'This field is required';
                                    }
                                    if (value.trim().length < 11) {
                                      return 'Fill in your phone correctly';
                                    }
                                    return null;
                                  },
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(5),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    left: 4,
                                    right: 4,
                                    top: 0,
                                    bottom: 0,
                                  ),
                                  child: CountriesDropdownComponent(),
                                ),
                                const SizedBox(
                                  height: 60,
                                ),
                                CustomButtonComponent(
                                  onTap: () {
                                    _trySubmitForm();
                                  },
                                  textTitle: 'Confirm',
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
          ],
        ),
      ),
    );
  }
}
