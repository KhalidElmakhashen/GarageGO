import 'package:flutter/material.dart';
import 'package:legarage/core/helpers/extensions.dart';
import 'package:legarage/core/helpers/shared_pref_helper.dart';
import 'package:legarage/core/routing/routes.dart';
import 'package:legarage/core/widgets/car_info_card.dart';
import 'package:legarage/core/widgets/personal_info_card.dart';
import 'package:legarage/core/widgets/profile_header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // AppBar
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  await SharedPrefHelper.clearAllSecuredData();
                  context.pushNamedAndRemoveUntil(
                    Routes.loginScreen ,
                    (Route<dynamic> route) => false,
                    predicate: (Route<dynamic> route) => false,
                  );
                },
                icon: Icon(
                  Icons.settings,
                  color: Theme.of(context).colorScheme.surface,
                ))
          ],
          title: Text(
            'Profile Page',
            style: TextStyle(color: Theme.of(context).colorScheme.surface),
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),

        // Body
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          child: Column(
            children: [
              // profile header
              ProfileHeader(),

              // divider
              Divider(
                height: 25,
                color: Colors.grey[800],
                indent: 8,
                endIndent: 8,
              ),

              // personal info card
              PersonalInfoCard(
                fullName: "Khaled Abdo Abdelhamed",
                nationalId: '30207231101592',
                gender: "male",
                age: '22',
              ),

              // card info card
              CarInfoCard(
                model: 'BMW X6',
                licensePlateNumbe: 'ر ق م | 1',
                fuelType: 'fuel',
                year: '2025',
                insuranceStatus: 'Active',
                transmission: 'Manual',
                lincenseExpiryDate: '1/1/2030',
              )

              // payment method card
            ],
          ),
        ));
  }
}
