import 'dart:io';

import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';

class ImageProfile extends StatefulWidget {
  const ImageProfile({super.key});

  @override
  State<ImageProfile> createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
  File? image;

  Future<void> pickImageCamera() async {
    final imagePicked =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (imagePicked == null) {
      return;
    } else {
      setState(() => image = File(imagePicked.path));
    }
  }

  Future<void> pickImageGallery() async {
    final imagePicked =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imagePicked == null) {
      return;
    } else {
      setState(() => image = File(imagePicked.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      width: 96,
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
                  : Image.asset(
                      'assets/image/image.jpeg',
                    ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 34,
              width: 34,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.camera_alt,
                  color: AppColors.colorsIconWhite,
                  size: 18,
                ),
                onPressed: () => _onButtonPressed(),
              ),
            ),
          ),
        ],
      ),
    );
  }

////// Modal
  void _onButtonPressed() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          // stateles
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
