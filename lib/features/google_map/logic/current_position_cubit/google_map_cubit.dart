import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:legarage/core/helpers/location_helper.dart';
import 'package:legarage/features/google_map/logic/current_position_cubit/google_map_state.dart';

class GoogleMapCubit extends Cubit<GoogleMapState> {
  GoogleMapCubit() : super(GoogleMapInitial());

  Completer<GoogleMapController> mapController = Completer();
  CameraPosition? myCurrentLocation;

  Future<void> getMyCurrentLocation() async {
    emit(GoogleMapLoading());
    Position position = await LocationHelper.getCurrentLocation();

    myCurrentLocation = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 14.4746,
    );

    emit(GoogleMapSuccess());
  }

  Future<void> goToMyCurrentLocation() async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(myCurrentLocation!));
  }

}
