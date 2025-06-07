
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Step1Content extends StatelessWidget {
  const Step1Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome to GarageGO!',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              'Your account was created successfully.\nLet\'s set up your profile so you can start using all features.',
              style: TextStyle(fontSize: 15.sp, color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
          ],
        );
  }
}