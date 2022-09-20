import 'package:flutter/material.dart';
import 'package:fteam_firebase_login_app/screens/profile_settings_screen/components/image_profile_components.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';
import 'components/text_header_profile_components.dart';

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
  String _confirmCountry = '';

  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);
      debugPrint(_userName);
      debugPrint(_telephone);
      debugPrint(_confirmCountry);
      Navigator.pushNamed(context, '/finish');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorsBackgroundWhite,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
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
            const TextHeaderProfileComponents(),
            const ImageProfile(),
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
                          CustomTextFormFieldComponents(
                            label: 'Display Name',
                            hintText: '  Enter your name',
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
                          CustomTextFormFieldComponents(
                            label: 'CPF',
                            hintText: '  CPF',
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            icon: Icons.mode_edit_outline_outlined,
                            onChanged: (value) => _userEmail = value,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp("[0-9]{3}[.]\\?[0-9]{3}[.]\\?[0-9]{3}[-]\\?[0-9]{2}")
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
                          CustomTextFormFieldComponents(
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
                              if (value.trim().length < 10) {
                                return 'Fill in your phone correctly';
                              }
                              return null;
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5),
                          ),

                          /// TODO: dropdown country
                          CustomTextFormFieldComponents(
                            label: 'Country',
                            hintText: '  Country',
                            textInputAction: TextInputAction.done,
                            icon: Icons.edit_location_outlined,
                            onChanged: (value) => _confirmCountry = value,

                            /// TODO: ARRUMAR
                            // suffixIcon: const Icon(
                            //   Icons.keyboard_arrow_down_outlined,
                            //   color: AppColors.primaryColor,
                            //   size: 24,
                            // ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),

                          InkWell(
                            onTap: () {
                              _trySubmitForm();
                            },
                            child: const BottomComponents(
                              textTitle: 'Confirm',
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
