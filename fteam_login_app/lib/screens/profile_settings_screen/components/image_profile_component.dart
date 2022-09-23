import 'dart:io';

import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';

class ImageProfile extends StatefulWidget {
  const ImageProfile({super.key});

  @override
  State<ImageProfile> createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
  File? image;

  Future pickImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('failed to pick image: $e');
    }
  }

  Future pickImageGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      width: 96,
      child: Expanded(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 96,
                width: 96,
                child: image != null
                    ? Image.file(
                        image!,
                        fit: BoxFit.cover,
                      )
                    : Image.asset('assets/image/image.jpeg'),
              ),
            ),
            Align(
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
            ),
          ],
        ),
      ),
    );
  }

////// Modal
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

  Column _buildBottomNavigatonMenu() {
    return Column(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.camera_alt_outlined),
          title: const Text('Select the camera'),
          onTap: () => pickImageCamera(),
        ),
        ListTile(
          leading: const Icon(Icons.image_search),
          title: const Text('Select the gallery'),
          onTap: () => pickImageGallery(),
        ),
      ],
    );
  }
}
