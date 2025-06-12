import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legarage/features/profile/logic/get_user_data_cubit/get_user_data_cubit.dart';

import 'package:legarage/features/profile/ui/widgets/info_holder.dart';

class ProfilePageLisnter extends StatelessWidget {
  const ProfilePageLisnter({super.key});

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     InfoHolder(
    //       firstName: 'khlaed',
    //       lastName: 'Elsharkawy',
    //       phoneNumber: '01000000000',
    //       email: 'kklajfdlksdfl@gmail.com'

    //     ),
    //   ],
    // );
    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
      buildWhen: (previous, current) =>
          // current is Loading || current is Error || current is Success,
          current is Loading || current is Error || current is Success,
      builder: (context, state) {
        final widget = state.whenOrNull(
          loading: () => InfoHolder(),  
          success: (userData) {
            return InfoHolder(
              firstName: userData.data.firstName,
              lastName: userData.data.lastName,
              phoneNumber: userData.data.phoneNumber,
              email: userData.data.email,
            );
          },
        );
        return widget ?? InfoHolder();
      },
    );
    // return BlocBuilder<GetCarsCubit, GetCarsState>(
    //   buildWhen: (previous, current) =>
    //       current is Loading || current is Error || current is Success,
    //   builder: (context, state) {
    //     final widget = state.whenOrNull(
    //       loading: () => InfoHolder(),  
    //       success: (userData) {
    //         return InfoHolder(
    //           firstName: 'khlaed',
    //           lastName: 'Elsharkawy',
    //           phoneNumber: '01000000000',
    //           email: 'khaled@gmiail.com',
    //           carModel: userData.cars.model,
    //           carType: userData.cars.type,
    //           plateNumber: userData.cars.plateNumber,
    //         );
    //       },
    //     );
    //     return widget ?? InfoHolder();
    //   },
    // );
  }
}
