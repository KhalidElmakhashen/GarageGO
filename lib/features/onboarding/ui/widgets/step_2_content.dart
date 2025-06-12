import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legarage/core/di/dependency_injection.dart';
import 'package:legarage/features/onboarding/logic/complete_setup_cubit/complete_setup_cubit.dart';

class Step2Content extends StatelessWidget {
   Step2Content({super.key});


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
              controller: getIt<CompleteSetupCubit>().carModelController,
              decoration: InputDecoration(
                labelText: 'Car Model',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r)),
              ),
            ),
            SizedBox(height: 12.h),
            TextField(
              controller: getIt<CompleteSetupCubit>().plateNumberController,
              decoration: InputDecoration(
                labelText: 'Plate Number',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r)),
              ),
            ),
            SizedBox(height: 12.h),
            TextField(
              controller: getIt<CompleteSetupCubit>().carTypeController,  
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