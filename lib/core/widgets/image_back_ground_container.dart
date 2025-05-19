
import 'package:flutter/material.dart';

class ImageBackGroundContainer extends StatelessWidget {
  final String imagePath;
  const ImageBackGroundContainer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
          height: double.infinity,
          width: double.infinity,
          decoration:  BoxDecoration(
            // borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        );
  }
}