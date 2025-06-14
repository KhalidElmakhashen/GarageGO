import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legarage/core/helpers/constants.dart';
import 'package:legarage/core/helpers/shared_pref_helper.dart';
import 'package:legarage/features/onboarding/logic/complete_setup_cubit/complete_setup_cubit.dart';

class Step4Content extends StatelessWidget {
  const Step4Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You\'re ready to explore iSpot!',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10.h),
        Text(
          'Thank you for completing your profile. Now you can easily find, reserve, and manage parking spots with just a few taps.',
          style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
        ),
        SizedBox(height: 10.h),
        
        SizedBox(height: 20.h),
        Center(
          child: ElevatedButton.icon(
            onPressed: () async {
              String userIdString = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userId);
              int userId = int.parse(userIdString);
              // getIt<CompleteSetupCubit>().addNewCar(userId);
              context.read<CompleteSetupCubit>().addNewCar(userId);
            },
            icon: Icon(Icons.check_circle, color: Colors.white),
            label: Text(
              "Start Using App",
              style: TextStyle(fontSize: 16.sp, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(
                  horizontal: 32.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}