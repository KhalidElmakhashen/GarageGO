import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legarage/features/explore_page/logic/garage_by_id_cubit/garagebyid_cubit.dart';
import 'package:legarage/features/explore_page/ui/widgets/garage_data_holder.dart';
import 'package:legarage/features/explore_page/ui/widgets/toggle_gesture.dart';

// ignore: must_be_immutable
class WidgetsInsideSlidingUpPanel extends StatelessWidget {
  ScrollController? scrollController;

  WidgetsInsideSlidingUpPanel({
    required scrollController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[300],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            image: const DecorationImage(
              image: AssetImage('assets/images/seramic.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        ListView(
          padding: EdgeInsets.zero,
          controller: scrollController,
          children: [
            ToggleGesture(),

            SizedBox(
              height: 14.h,
            ),

            // Padding(
            //   padding: EdgeInsets.all(12.0.h),
            //   child: SearchBar(
            //     leading: Icon(Icons.search),
            //     hintText: "Search For a Spot?",
            //   ),
            // )

            BlocBuilder<GaragebyidCubit, GaragebyidState>(
              buildWhen: (previous, current) =>
                  current is Loading || current is Error || current is Success,
              builder: (context, state) {
                final widget = state.whenOrNull(
                  loading: () => const GarageInfoHolder(
                    isLoading: true,
                  ),
                  error: (error) {
                    return  Container(
                      height: 50,
                      child: Center(
                        child: Text(
                          error,
                          style: TextStyle(
                            fontSize: 36.sp,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    );
                  },
                  success: (garageByIdResponse) {
                    return GarageInfoHolder(
                      garageId:  garageByIdResponse.garageData.garageId,
                      name: garageByIdResponse.garageData.name,
                      address: garageByIdResponse.garageData.address,
                      city: garageByIdResponse.garageData.city,
                      totalSpots: garageByIdResponse.garageData.totalSpots,
                      availableSpots:
                          garageByIdResponse.garageData.availableSpots,
                      reservedSpots:
                          garageByIdResponse.garageData.reservedSpots,
                      rating: 4.68,
                    );
                  },
                );
                return widget ??
                    const GarageInfoHolder(
                      name: "Chose Garage First",
                      address: "Chose Garage First",
                      city: "Chose Garage First",
                    );
              },
            ),
          ],
        ),
      ],
    );
  }
}
