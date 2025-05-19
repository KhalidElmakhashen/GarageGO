import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legarage/core/helpers/constants.dart';
import 'package:legarage/core/helpers/shared_pref_helper.dart';
import 'package:legarage/features/explore_page/logic/add_reservation_cubit/add_reservation_cubit.dart';
import 'package:legarage/features/explore_page/ui/widgets/shimmer_effect.dart';


class GarageInfoHolder extends StatelessWidget {
  final int? garageId;
  final String? name;
  final String? address;
  final String? city;
  final int? totalSpots;
  final int? availableSpots;
  final int? reservedSpots;
  final double? rating;
  final bool isLoading;

  Future<int> getUserId() async{
    String userid = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userId);
    return int.parse(userid);
  }

  const GarageInfoHolder({
    super.key,
    this.garageId,
    this.name,
    this.address,
    this.city,
    this.totalSpots,
    this.availableSpots,
    this.reservedSpots,
    this.rating,
    this.isLoading = false,
  });



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            leading: Text("Garage Name     :",style: TextStyle(fontSize: 16.h,color: Colors.black),),
            title: isLoading ? ShimmerGarageInfo() : Text(name ?? "No Name", style: TextStyle(fontSize: 18.h,fontWeight: FontWeight.bold ,color: Colors.white)),
          ),
          ListTile(
            leading: Text("Garage Address :",style: TextStyle(fontSize: 16.h,color: Colors.black),),
            title: isLoading ? ShimmerGarageInfo() : Text(address ?? "No Address", style: TextStyle(fontSize: 18.h,fontWeight: FontWeight.bold,color: Colors.white)),
          ),
          ListTile(
            leading: Text("Garage City        :",style: TextStyle(fontSize: 16.h,color: Colors.black),),
            title: isLoading ? ShimmerGarageInfo() : Text(city ?? "No City", style: TextStyle(fontSize: 18.h,fontWeight: FontWeight.bold,color: Colors.white)),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _SpotTile(label: "Total", value: totalSpots?.toString() ?? "-", color: Colors.blue),
                  _SpotTile(label: "Available", value: availableSpots?.toString() ?? "-", color: Colors.green),
                  _SpotTile(label: "price", value: 50.toString() ?? "-", color: Colors.red),
                  _SpotTile(label: "rating", value: rating?.toString() ?? "-", color: Colors.yellow[700]!),
                ],
              ),
            ),
          ),

          SizedBox(height: 16.h),
          SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  onPressed:  () async {
                    int userid = await getUserId();
                    context.read<AddReservationCubit>().addReservationRecord(userid,garageId!);
                  },
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: Theme.of(context).colorScheme.primary,
                    backgroundColor: Colors.blue,
                    foregroundColor: Theme.of(context).colorScheme.secondary,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.surface,
                        width: 2.5,
                      ),
                    ),
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      letterSpacing: 1.2,
                    ),
                  ),
                  child: const Text("Reserve Spot"),
                ),
              ),
        ],
      ),
    );
  }
}

class _SpotTile extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _SpotTile({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: color)),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
      ],
    );
  }
}

