import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legarage/features/current_page/ui/widget/camera_photage.dart';
import 'package:legarage/features/current_page/ui/widget/current_cost_card.dart';
import 'package:legarage/core/widgets/custom_expansion_tiles.dart';
import 'package:legarage/features/current_page/ui/widget/custom_timer.dart';
import 'package:legarage/features/current_page/ui/widget/nearest_way.dart';
import 'package:legarage/features/current_page/ui/widget/spot_details_card.dart';

class IsReservedTrue extends StatelessWidget {
  final String? time;
  const IsReservedTrue({super.key, this.time});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Spot Details Card
            SizedBox(
              height: 100.h,
            ),
            const CustomExpantionTiles(
              title: "Current Spot Details",
              child: SpotDetailsCard(
                garageName: "iSpot",
                location: "Domyat Elgideda / Elmarkaziya / 3alfa7m restorant",
                avgPrice: '15/h',
                slotNo: '14',
                floorNO: '4',
                buildingNo: '2',
                vichelType: 'Car (suv)',
              ),
            ),
            
             SizedBox(
              height: 20.h,
            ),

            // Timer for Remaining Time
             CustomTimer(time: time),

            //  SizedBox(
            //   height: 20.h,
            // ),

            // find nearest way
            // const NearestWay(),

             SizedBox(
              height: 20.h,
            ),

            // Reservation Status
            const CurrentCostCard(),

             SizedBox(
              height: 20.h,
            ),

            // Camera Photage
            CameraPhotage(),
            // CameraPhotage2(),
          ],
        ),
      ),
    );
  }
}



            // BlocBuilder<GaragebyidCubit, GaragebyidState>(
            //   buildWhen: (previous, current) =>
            //       current is Loading || current is Error || current is Success,
            //   builder: (context, state) {
            //     final widget = state.whenOrNull(
            //       // initial: () => const 
            //       loading: () {
            //         return const Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       },
            //       error: (error) {
            //         return Center(
            //           child: Text(
            //             error,
            //             style: TextStyle(
            //               fontSize: 16,
            //               color: Theme.of(context).colorScheme.error,
            //             ),
            //           ),
            //         );
            //       },
            //       success: (garageByIdResponse) {
            //         return SpotDetailsCard(
            //           garageName: garageByIdResponse.garageName,
            //           location:
            //               "${garageByIdResponse.garageLocation} / ${garageByIdResponse.garageLocation} / ${garageByIdResponse.garageLocation}",
            //           avgPrice: '${garageByIdResponse.avgPrice}/h',
            //           slotNo: garageByIdResponse.slotNo.toString(),
            //           floorNO: garageByIdResponse.floorNo.toString(),
            //           buildingNo: garageByIdResponse.buildingNo.toString(),
            //           vichelType: garageByIdResponse.vichelType,
            //         );
            //       },
            //     );
            //     return widget ??
            //         Container(
            //           child: Text("not KNOWN"),
            //         );
            //   },
            // ),