
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class Step3Content extends StatefulWidget {
   Step3Content({super.key});

  @override
  State<Step3Content> createState() => _Step3ContentState();
}

class _Step3ContentState extends State<Step3Content> {
  File? _profileImage;

  Future<void> createImagePath(String pickedFilePath) async {
    var directory = await getApplicationDocumentsDirectory();
    String imagePath = '${directory.path}/profile_image.png';
    final imageFile = File(pickedFilePath);
    final savedImage = await imageFile.copy(imagePath);

    // File profileImage = File(imagePath);
    //  = imageFile.copy(profileImage);
  }

  Future<void> _pickProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      await createImagePath(pickedFile.path);
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upload your profile picture:',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16.h),
            Center(
              child: GestureDetector(
                onTap: _pickProfileImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  backgroundImage:
                      _profileImage != null ? FileImage(_profileImage!) : null,
                  child: _profileImage == null
                      ? Icon(Icons.camera_alt, size: 40, color: Colors.grey[700])
                      : null,
                ),
              ),
            )
          ],
        );
  }
}