// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legarage/core/di/dependency_injection.dart';

import 'package:legarage/core/helpers/spacing.dart';
import 'package:legarage/core/widgets/custom_expansion_tiles.dart';
import 'package:legarage/features/profile/logic/get_cars_cubit/get_cars_cubit.dart';
import 'package:legarage/features/profile/ui/widgets/car_info_card.dart';
import 'package:legarage/features/profile/ui/widgets/personal_info_card.dart';
import 'package:legarage/features/profile/ui/widgets/profile_header.dart';

class InfoHolder extends StatefulWidget {
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? plateNumber;
  String? carModel;
  String? carType;

  InfoHolder({
    Key? key,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.plateNumber,
    this.carModel,
    this.carType,
  }) : super(key: key);

  @override
  State<InfoHolder> createState() => _InfoHolderState();
}

class _InfoHolderState extends State<InfoHolder> {
  String? getFullName() {
    if (widget.firstName != null && widget.lastName != null) {
      return "${widget.firstName} ${widget.lastName}";
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    // Removed duplicate getCars call
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(100),
        // profile header
        ProfileHeader(
          firstName: widget.firstName,
          lastName: widget.lastName,
          email: widget.email,
        ),

        // personal info card
        verticalSpace(50),
        CustomExpantionTiles(
          title: "Personal Info",
          child: PersonalInfoCard(
            fullName: getFullName(),
            phoneNumber: widget.phoneNumber,
          ),
        ),

        // card info card
        verticalSpace(10),
        // CustomExpantionTiles(
        //           title: "Car Info",
        //           child: CarInfoCard(
        //             carModel: widget.carModel,
        //             plateNumber: widget.plateNumber,
        //             carType: widget.carType,
        //           ),
        //         ),
        BlocBuilder<GetCarsCubit, GetCarsState>(
          buildWhen: (previous, current) =>
              // previous != current &&
              current is Loading || current is Error || current is Success,
          builder: (context, state) {
            final widget = state.whenOrNull(
              success: (cars) {
                return CustomExpantionTiles(
                  title: "Car Info",
                  child: CarInfoCard(
                    carModel: cars.cars.model,
                    plateNumber: cars.cars.plateNumber,
                    carType: cars.cars.type,
                  ),
                );
              },
            );
            return widget ??
                CustomExpantionTiles(
                  title: "Car Info",
                  child: CarInfoCard(
                    carModel: this.widget.carModel,
                    plateNumber: this.widget.plateNumber,
                    carType: this.widget.carType,
                  ),
                );
          },
        ),

        // payment method card 
        verticalSpace(10),
        CustomExpantionTiles(
          title: "Card Info",
          child: Container(),
        ),
      ],
    );
  }
}
