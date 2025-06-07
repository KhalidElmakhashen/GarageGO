import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:legarage/features/google_map/logic/current_position_cubit/google_map_cubit.dart';
import 'package:legarage/features/google_map/logic/current_position_cubit/google_map_state.dart';
import 'package:legarage/features/google_map/logic/garages_cubit/garages_cubit.dart';
import 'package:legarage/features/google_map/ui/widgets/my_google_map.dart';

class MainScreenMap extends StatefulWidget {
  const MainScreenMap({super.key});

  @override
  State<MainScreenMap> createState() => _MainScreenMapState();
}

class _MainScreenMapState extends State<MainScreenMap> {
  @override
  void initState() {
    super.initState();
    context.read<GoogleMapCubit>().getMyCurrentLocation();
    context.read<GaragesCubit>().getAllGarages().whenComplete(
      () => setState(() {
        
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GoogleMapCubit, GoogleMapState>(
        builder: (context, state) {
          if (state is GoogleMapLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GoogleMapError) {
            return Center(child: Text(state.errorMessage));
          } else if (state is GoogleMapSuccess) {
            return MyGoogleMap();
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}
