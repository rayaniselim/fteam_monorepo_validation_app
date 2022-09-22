import 'package:flutter/material.dart';
import 'camera_component.dart';

class ImageProfile extends StatefulWidget {
  const ImageProfile({
    super.key,
  });

  @override
  State<ImageProfile> createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 30,
        ),
        child: Stack(
          children: [
            Container(
              height: 105,
              width: 105,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(25),
                image: const DecorationImage(
                  image: AssetImage('assets/image/image.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const CameraComponent(),
            ),
            //   ),
            // ),
          ],
          // ),
        ),
      ),
      // ),
    );
  }
}
