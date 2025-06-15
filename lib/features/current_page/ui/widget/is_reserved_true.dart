import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legarage/core/di/dependency_injection.dart';
import 'package:legarage/core/helpers/constants.dart';
import 'package:legarage/core/helpers/extensions.dart';
import 'package:legarage/core/helpers/shared_pref_helper.dart';
import 'package:legarage/core/routing/routes.dart';
import 'package:legarage/core/services/signalR_service.dart';
import 'package:legarage/features/current_page/logic/entities/current_spot_details_entity.dart';
import 'package:legarage/features/current_page/logic/timer_cost_cubit/timer_cost_cubit.dart';
import 'package:legarage/features/current_page/ui/widget/camera_photage.dart';
import 'package:legarage/features/current_page/ui/widget/current_cost_card.dart';
import 'package:legarage/core/widgets/custom_expansion_tiles.dart';
import 'package:legarage/features/current_page/ui/widget/custom_timer.dart';
import 'package:legarage/features/current_page/ui/widget/custom_timer_count_up.dart';
import 'package:legarage/features/current_page/ui/widget/show_dialog.dart';
import 'package:legarage/features/current_page/ui/widget/spot_details_card.dart';

class IsReservedTrue extends StatefulWidget {
  final String? time;
  IsReservedTrue({super.key, this.time});

  @override
  State<IsReservedTrue> createState() => _IsReservedTrueState();
}

class _IsReservedTrueState extends State<IsReservedTrue> {
  void isReservedFalse() async {
    await SharedPrefHelper.removeData(SharedPrefKeys.reservationId);
    
  }

  Future<void> getSpotDetatils() async {
    CurrentSpotDetailsEntity.garageName =
        await SharedPrefHelper.getString(SharedPrefKeys.garageName);
    CurrentSpotDetailsEntity.locatino =
        await SharedPrefHelper.getString(SharedPrefKeys.garageLocation);
    CurrentSpotDetailsEntity.vichelType =
        await SharedPrefHelper.getString(SharedPrefKeys.vichelType);
    CurrentSpotDetailsEntity.slotNo = await SharedPrefHelper.getString("spot");
    print(CurrentSpotDetailsEntity.slotNo.toString());
    setState(() {});
  }

    void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thank You'),
          content:  SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
               BlocSelector<TimerCostCubit, TimerCostState, double>(
            selector: (s) => s.cost,
            builder: (_, cost) => Text(
              'We Home To See You Soon.\n'
              'Total Cost Is: ${cost.toStringAsFixed(2)} E\u00A3',
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue, disabledForegroundColor: Colors.grey.withOpacity(0.38),
              ),
              onPressed: () {
                context.pushNamed(Routes.homeScreen);
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }

  
  @override
  void initState() {
    super.initState();
    getSpotDetatils();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
        stream: SignalRService().spotStream,
        builder: (_ , snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            CurrentSpotDetailsEntity.slotNo = snapshot.data;
          }
          CurrentSpotDetailsEntity.slotNo == '' ? isReservedFalse() : null;
         

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Spot Details Card
                  SizedBox(
                    height: 90.h,
                  ),
                  CustomExpantionTiles(
                    title: "Current Spot Details",
                    child: SpotDetailsCard(
                      garageName: CurrentSpotDetailsEntity.garageName ?? '...',
                      location: CurrentSpotDetailsEntity.locatino ?? '...',
                      avgPrice:
                          CurrentSpotDetailsEntity.avgPrice ?? '15 E\u00A3',
                      slotNo: CurrentSpotDetailsEntity.slotNo == ''
                          ? '...'
                          : CurrentSpotDetailsEntity.slotNo ?? "...",
                      floorNO: CurrentSpotDetailsEntity.floorNO ?? '...',
                      buildingNo: CurrentSpotDetailsEntity.buildingNo ?? '...',
                      vichelType: CurrentSpotDetailsEntity.vichelType ?? '...',
                    ),
                  ),

                  SizedBox(
                    height: 15.h,
                  ),

                  // Timer for Remaining Time
                  CurrentSpotDetailsEntity.slotNo == ''
                      ? CustomTimer(time: widget.time)
                      : CustomTimerCountUp(),
                  // : FutureBuilder(
                  //     future: TimerCostCubit.getSavedElapsedTime(),
                  //     builder: (context, snapshot) {
                  //       if (!snapshot.hasData)
                  //         return CircularProgressIndicator();

                  //       final initialElapsed = snapshot.data!;
                  //       return BlocProvider(
                  //         create: (_) =>
                  //             getIt<TimerCostCubit>()
                  //               ..update(initialElapsed),
                  //         child: CustomTimerCountUp(initial: initialElapsed),
                  //       );
                  //     },
                  //   ),

                  //  SizedBox(
                  //   height: 20.h,
                  // ),

                  // find nearest way
                  // const NearestWay(),
                 

                  SizedBox(
                    height: 20.h,
                  ),

                  // Reservation Status
                  CurrentCostCard(
                    spot: CurrentSpotDetailsEntity.slotNo == ''
                        ? null
                        : CurrentSpotDetailsEntity.slotNo,
                  ),

                  SizedBox(
                    height: 20.h,
                  ),

                  // Camera Photage
                  CameraPhotage(),
                ],
              ),
            ),
          );
        });
  }
}
