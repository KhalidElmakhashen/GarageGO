import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:legarage/features/explore_page/logic/garage_by_id_cubit/garagebyid_cubit.dart';
import 'package:legarage/features/explore_page/logic/toggle_panel_cubit/toggle_panel_cubit.dart';
import 'package:legarage/features/explore_page/logic/update_ui_cubit/update_ui_cubit.dart';
import 'package:legarage/features/google_map/logic/current_position_cubit/google_map_cubit.dart';
import 'package:legarage/features/google_map/logic/garages_cubit/garages_cubit.dart';

class MyGoogleMap extends StatelessWidget {
  const MyGoogleMap({super.key});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: true,
      myLocationButtonEnabled: false,
      initialCameraPosition: context.read<GoogleMapCubit>().myCurrentLocation!,
      onMapCreated: (mapController) {
        context.read<GoogleMapCubit>().mapController.complete(mapController);
      },
      markers: context.read<GaragesCubit>().markers.map((marker) {
        return marker.copyWith(
          onTapParam: () {
            context
                .read<GaragebyidCubit>()
                .getGarageById(int.parse(marker.markerId.value));
            // Open the sliding-up panel when a marker is tapped
            context.read<TogglePanelCubit>().openPanel();
            context.read<UpdateUiCubit>().updateUi();
            // Optionally, update the UI with the selected garage details
            // context.read<GaragesCubit>().selectGarage(marker.markerId.value);
          },
        );
      }).toSet(),
    );
    ;
  }
}
