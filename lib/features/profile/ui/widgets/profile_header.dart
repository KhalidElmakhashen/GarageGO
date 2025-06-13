// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:legarage/core/helpers/spacing.dart';
import 'package:legarage/core/widgets/shimmer_effect.dart';
import 'package:legarage/features/onboarding/logic/func/create_image_path.dart';
import 'package:path_provider/path_provider.dart';

class ProfileHeader extends StatefulWidget {
  String? firstName;
  String? lastName;
  String? email;
  bool isLoading;

  ProfileHeader({
    Key? key,
    this.firstName,
    this.lastName,
    this.email,
    this.isLoading = false,
  }) : super(key: key);

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  late String imagePath;
  File? profileImage;

  @override
  void initState() {
    super.initState();
    _initImagePath();
  }

  Future<void> _initImagePath() async {
    final directory = await getApplicationDocumentsDirectory();
    imagePath = '${directory.path}/profile_image.png';
    final imageFile = File(imagePath);
    if (await imageFile.exists()) {
      setState(() {
        profileImage = imageFile;
      });
    }
  }

  Future<void> pickProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      await createImagePath(pickedFile.path); // copy picked image to imagePath
      setState(() {
        profileImage = File(pickedFile.path); // update new image
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onDoubleTap: pickProfileImage,
          child: CircleAvatar(
            radius: 55,
            backgroundColor: Colors.grey[300],
            backgroundImage: profileImage != null ? FileImage(profileImage!) : null,
            child: profileImage == null
                ? Icon(Icons.camera_alt, size: 40, color: Colors.grey[700])
                : null,
          ),
        ),
        const SizedBox(width: 18),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.firstName == null
                  ? ShimmerEffect()
                  : Text(
                      widget.firstName ?? "Some On Name",
                      style: TextStyle(
                        fontSize: 20.h,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F3171),
                      ),
                    ),
              verticalSpace(15),
              widget.email == null
                  ? ShimmerEffect()
                  : Text(
                      widget.email ?? "someonename@example.com",
                      style: TextStyle(
                        fontSize: 16.h,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F3171),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
