import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Step2Content extends StatelessWidget {
   Step2Content({super.key});

    // Controllers for car info fields
  final TextEditingController carModelController = TextEditingController();
  final TextEditingController plateNumberController = TextEditingController();
  final TextEditingController carTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please enter your car information:',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16.h),
            TextField(
              controller: carModelController,
              decoration: InputDecoration(
                labelText: 'Car Model',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r)),
              ),
            ),
            SizedBox(height: 12.h),
            TextField(
              controller: plateNumberController,
              decoration: InputDecoration(
                labelText: 'Plate Number',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r)),
              ),
            ),
            SizedBox(height: 12.h),
            TextField(
              controller: carTypeController,
              decoration: InputDecoration(
                labelText: 'Car Type',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r)),
              ),
            ),
          ],
        );
  }
}