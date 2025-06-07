// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:legarage/core/helpers/spacing.dart';
import 'package:legarage/core/widgets/custom_expansion_tiles.dart';
import 'package:legarage/features/profile/ui/widgets/car_info_card.dart';
import 'package:legarage/features/profile/ui/widgets/personal_info_card.dart';
import 'package:legarage/features/profile/ui/widgets/profile_header.dart';

class InfoHolder extends StatelessWidget {
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

  String? getFullName() {
    if (firstName != null && lastName != null) {
      return "$firstName $lastName";
    } 
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(100),
        // profile header
        ProfileHeader(
          firstName: firstName,
          lastName: lastName,
          email: email,
        ),

        // personal info card
        verticalSpace(50),
        CustomExpantionTiles(
          title: "Personal Info",
          child: PersonalInfoCard(
            fullName: getFullName(),
            phoneNumber: phoneNumber,

          ),
        ),

        // card info card
        verticalSpace(10),
         CustomExpantionTiles(
          title: "Car Info",
          child: CarInfoCard(
            carModel: carModel,
            plateNumber: plateNumber,
            carType: carType,
          ),
        ),
        verticalSpace(10),
        CustomExpantionTiles(
          title: "Card Info",
          child: Container(),
        )

        // payment method card
      ],
    );
  }
}
