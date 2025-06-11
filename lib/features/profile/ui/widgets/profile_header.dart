// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legarage/core/helpers/spacing.dart';
import 'package:legarage/core/widgets/shimmer_effect.dart';
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
  String imagePath = "assets/images/profile_image.png";

  Future<void> getImagePath() async {
    var directory = await getApplicationDocumentsDirectory();
    imagePath = '${directory.path}/profile_image.png';
    setState(() {}); // Replace with actual image path
  }

  @override
  Widget build(BuildContext context) {
    getImagePath();
    final profileImage = File(imagePath);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 55,
          backgroundColor: Colors.grey[300],
          backgroundImage:
              profileImage.existsSync() ? FileImage(profileImage) : null,
          child: profileImage.existsSync()
              ? null
              : Icon(Icons.camera_alt, size: 40, color: Colors.grey[700]),
        ),
        const SizedBox(
          width: 18,
        ),
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
                          color: Color(0xFF1F3171)),
                    ),
              verticalSpace(15),
              widget.email == null
                  ? ShimmerEffect()
                  : Text(
                      widget.email ?? "someonename@example.com",
                      style: TextStyle(
                        fontSize: 16.h,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F3171)   ,
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
