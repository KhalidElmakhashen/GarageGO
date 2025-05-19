import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:legarage/features/explore_page/logic/garage_by_id_cubit/garagebyid_cubit.dart';
import 'package:legarage/features/google_map/data/repo/get_all_garages_repo.dart';

part 'garages_state.dart';
part 'garages_cubit.freezed.dart';

class GaragesCubit extends Cubit<GaragesState> {
  GetAllGaragesRepo _getAllGaragesRepo ;
  late BitmapDescriptor _garageIcon;
  List<Marker> markers = [];
  // Map<String, dynamic> selectedGarageData = {};
  GaragesCubit(this._getAllGaragesRepo) : super(GaragesState.initial());
  

    Future<void> getAllGarages() async {
    emit(const GaragesState.loading());
    final response = await _getAllGaragesRepo.getAllGarages();
    response.when(success: (getAllGarageResponse) async {
      await  _loadCustomIcon();
      markers = getAllGarageResponse.garageData!.map((garage) {
          return Marker(
            markerId: MarkerId(garage.garageId.toString()),
            position: LatLng(garage.latitude, garage.longitude),
            infoWindow: InfoWindow(
              title: garage.name,
              snippet: garage.address,
            ),
            icon: _garageIcon,
            onTap: () {
              // this function not working so  figure out how to make it work
              //  print("tap on marker: \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
              // selectedGarageData = {
              //   'garageId': garage.garageId,
              //   'name': garage.name,
              //   'address': garage.address,
              //   'city': garage.city,
              //   'totalSpots': garage.totalSpots,
              //   'latitude': garage.latitude,
              //   'longitude': garage.longitude,
              //   'availableSpots': garage.availableSpots,
              //   'reservedSpots': garage.reservedSpots,
              //   'ownerId': garage.ownerId,
              // };
              // emit(GaragesState.selectedGarage(selectedGarageData));
              // context.read<GaragebyidCubit>().getGarageById(garage.garageId);
            },
          );
        }).toList();
      
      emit(GaragesState.success(getAllGarageResponse));
    }, failure: (error) {
      emit(GaragesState.error(error: error.apiErrorModel.message ?? ''));
    });
  }


  Future<void> _loadCustomIcon() async {
  _garageIcon = await BitmapDescriptor.asset(
    const ImageConfiguration(size: Size(48, 48)),
    'assets/images/is_logo.png',
  );
}
}
