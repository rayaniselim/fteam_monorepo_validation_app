import 'dart:io';

import 'package:flutter/material.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';

class CameraComponent extends StatefulWidget {
  const CameraComponent({super.key});

  @override
  State<CameraComponent> createState() => _CameraComponentState();
}

class _CameraComponentState extends State<CameraComponent> {
  String _selectedItem = '';
  late File photo;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        height: 34,
        width: 34,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: IconButton(
          icon: const Icon(
            Icons.camera_alt,
            color: Colors.white,
            size: 18,
          ),
          onPressed: () => _onButtonPressed(),
        ),
      ),
    );
  }

  void _onButtonPressed() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 115,
          color: const Color(0xFF737373),
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.colorsBackgroundWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: _buildBottomNavigatonMenu(),
          ),
        );
      },
    );
  }

  /// TOOD: CAMERA IMAGE_PICKER
  Column _buildBottomNavigatonMenu() {
    return Column(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.camera_alt_outlined),
          title: const Text('select the camera'),
          onTap: () => _selectItem('select the camera'),
          // onTap: () => Get.to( () => ()),
        ),
        ListTile(
          leading: const Icon(Icons.image_search),
          title: const Text('select the gallery'),
          onTap: () => _selectItem('select the camera'),
        ),
      ],
    );
  }

  void _selectItem(String name) {
    Navigator.pop(context);
    setState(() {
      _selectedItem = name;
    });
  }
}
