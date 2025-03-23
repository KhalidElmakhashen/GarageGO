import 'package:flutter/material.dart';
import 'package:legarage/presentation/widgets/camera_photage.dart';
import 'package:legarage/presentation/widgets/current_cost_card.dart';
import 'package:legarage/presentation/widgets/custom_timer.dart';
import 'package:legarage/presentation/widgets/nearest_way.dart';
import 'package:legarage/presentation/widgets/spot_details_card.dart';

class CurrentPage extends StatelessWidget {
  const CurrentPage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Spot Detials',
          style: TextStyle(color: Theme.of(context).colorScheme.surface),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body:  SingleChildScrollView(
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children:  [
              // Spot Details Card
              const SpotDetailsCard(
                garageName: "ISpot",
                location: "Domyat Elgideda / Elmarkaziya / 3alfa7m restorant",
                avgPrice: '15/h',
                slotNo: '14',
                floorNO: '4',
                buildingNo: '2',
                vichelType: 'Car (suv)',
              ),

              const SizedBox(
                height: 15,
              ),

              // Timer for Remaining Time
              const CustomTimer(),

              const SizedBox(
                height: 15,
              ),

              // find nearest way
              const NearestWay(),

              
              const SizedBox(
                height: 15,
              ),


              // Reservation Status
              const CurrentCostCard(),

              const SizedBox(
                height: 15,
              ),

              // Camera Photage
             CameraPhotage(),
            ],
          ),
        ),
      ),
    );
  }
}
