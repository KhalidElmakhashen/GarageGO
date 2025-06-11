import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legarage/core/di/dependency_injection.dart';
import 'package:legarage/features/explore_page/logic/add_reservation_cubit/add_reservation_cubit.dart';
import 'package:legarage/features/google_map/logic/current_position_cubit/google_map_cubit.dart';
import 'package:legarage/features/google_map/ui/main_screen_map.dart';
import 'package:legarage/features/explore_page/logic/toggle_panel_cubit/toggle_panel_cubit.dart';
import 'package:legarage/features/explore_page/ui/widgets/widgets_inside_sliding_up_panel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  static double fabHightClosed = 90;
  double fabHeight = fabHightClosed;

  @override
  Widget build(BuildContext context) {
    double panelHeightOpen = MediaQuery.of(context).size.height * 0.52;
    double panelHeightClosed = MediaQuery.of(context).size.height * 0.09;

    return Scaffold(
      body: Stack(alignment: Alignment.topCenter, children: [
        BlocListener<AddReservationCubit, AddReservationState>(
          listenWhen: (previous, current) =>  current is Loading || current is Success || current is Error,
          listener: (context, state) {
            state.whenOrNull(
              // loading: () =>  ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(
              //       content: Text('loading'),
              //       backgroundColor: Colors.green,
              //     ),
              //   ),
                success: (data) => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(data.message),
                    backgroundColor: Colors.green,
                  ),
                ),
                error: (error) => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error),
                    backgroundColor: Colors.green,
                  ),
                ),
            );
          },
          child: Container(),
        ),
        SlidingUpPanel(
          // SlidingUpPanel Setup and Configuration
          controller: context.read<TogglePanelCubit>().panelController,
          panelSnapping: false,
          minHeight: panelHeightClosed,
          maxHeight: panelHeightOpen,
          color: Theme.of(context).colorScheme.inversePrimary,
          parallaxEnabled: true,
          parallaxOffset: .8,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          onPanelSlide: (position) => setState(() {
            final panelMaxScrollExtent = panelHeightOpen - panelHeightClosed;
            fabHeight = panelMaxScrollExtent * position + fabHightClosed;
          }),

          // here we can add the map widget
          body: MainScreenMap(),

          // here we can add sliding up panel widget with components
          // like search bar and other widgets
          panelBuilder: (scrollController) => WidgetsInsideSlidingUpPanel(
            scrollController: scrollController,
          ),
        ),

        // here we can add the floating action button
        Positioned(
          right: 20.h,
          bottom: fabHeight,
          child: FloatingActionButton(
            // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            backgroundColor: Color(0xFF1F3171),
            onPressed: () {
              // getIt.unregister<GoogleMapCubit>();
              // getIt<GoogleMapCubit>().goToMyCurrentLocation();
              context.read<GoogleMapCubit>().goToMyCurrentLocation();
              // NOTE: This NOW has no need, but try to make the getAllGarages update UI so IT act like refresh
              // context.read<GaragesCubit>().getAllGarages();
              context.read<TogglePanelCubit>().closePanel();
            },
            child: const Icon(Icons.gps_fixed),
          ),
        ),
      ]),
    );
  }
}






















// import 'dart:convert';
// import 'package:legarage/core/di/dependency_injection.dart';
// import 'package:legarage/core/helpers/location_helper.dart';
// import 'package:legarage/features/explore_page/logic/garage_by_id_cubit/garagebyid_cubit.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'package:legarage/features/google_map/logic/garages_cubit/garages_cubit.dart';
// import 'package:location/location.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// class MyMap extends StatefulWidget {
//   const MyMap({super.key});

//   @override
//   State<MyMap> createState() => _MyMapState();
// }

// class _MyMapState extends State<MyMap> {
//   final MapController mapController = MapController();

//   Position? currentLoctation;
//   List<LatLng> routePoints = [LatLng(8.681495, 49.41461)];
//   List<Marker> markers = [];
//   final String orsApiKey =
//       '5b3ce3597851110001cf62481079c23e6e3c4c7d919cb5f5e555d8a0';

//   @override
//   void initState() {
//     getCurrentLocation();
//     super.initState();
//   }

//   Future<void> getCurrentLocation() async {
//     var location = Location();

//     try {
//       // var userLocation = await location.getLocation();
//       var userLocation = await LocationHelper.getCurrentLocation();
//       setState(() {
//         currentLoctation = userLocation;
//         markers.add(Marker(
//             width: 80.0,
//             height: 80.0,
//             point: LatLng(userLocation.latitude!, userLocation.longitude!),
//             child: const Icon(Icons.my_location)));
//       });
//     } on Exception {
//       currentLoctation = null;
//     }

//     // location.onLocationChanged.listen((LocationData newLocation) {
//     //   setState(() {
//     //     currentLoctation = newLocation;
//     //   });
//     // });
//   }

//   Future<void> _getRoute(LatLng destination) async {
//     if (currentLoctation == null) return;

//     final start =
//         LatLng(currentLoctation!.latitude!, currentLoctation!.longitude!);
//     final response = await http.get(Uri.parse(
//         'https://api.openrouteservice.org/v2/directions/driving-car?api_key=5b3ce3597851110001cf62481079c23e6e3c4c7d919cb5f5e555d8a0&start=${start.latitude},${start.longitude}&end=${destination.latitude},${destination.longitude}'));
//     /*
//                 'https://api.openrouteservice.org/v2/directions/driving-car?api_key=5b3ce3597851110001cf62481079c23e6e3c4c7d919cb5f5e555d8a0&start=8.681495,49.41461&end=8.687872,49.420318'

//                 'https://api.openrouteservice.org/v2/directions/driving-car?api_key=5b3ce3597851110001cf62481079c23e6e3c4c7d919cb5f5e555d8a0&start=${start!.latitude!},${start!.longitude!}&end=${destination!.latitude!},${destination!.longitude}'

//          */
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       final List<dynamic> coords =
//           data['features'][0]['geometry']['coordinates'];
//       setState(() {
//         routePoints = coords
//             .map((coord) => LatLng(coord[1].toDouble(), coord[0].toDouble()))
//             .toList();
//         markers.add(Marker(
//           width: 80,
//           height: 80,
//           point: destination,
//           child: const Icon(Icons.location_on),
//         ));
//       });
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Failed To Fetch The Route!!'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//     }
//   }

//   void _addDestinationMarker(LatLng point) {
//     setState(() {
//       markers.add(Marker(
//         width: 80,
//         height: 80,
//         point: point,
//         child: const Icon(Icons.location_on),
//       ));
//     });
//     _getRoute(point);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // body
//       body: currentLoctation == null
//           ? const Center(
//               child: CircularProgressIndicator(),
//             )
//           : FlutterMap(
//               mapController: mapController,
//               options: MapOptions(
//                 initialZoom: 16,
//                 initialCenter: LatLng(
//                     currentLoctation!.latitude!, currentLoctation!.longitude!),
//                 onTap: (tapPosition, point) => _addDestinationMarker(point),
//               ),
//               children: [
//                   TileLayer(
//                     urlTemplate:
//                         "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//                     subdomains: const ['a', 'b', 'c'],
//                   ),
//                   MarkerLayer(markers: markers),
//                   PolylineLayer(polylines: [
//                     Polyline(
//                         points: routePoints,
//                         strokeWidth: 4.0,
//                         color: Colors.black)
//                   ])
//                 ]),
//       floatingActionButton: Transform.translate(
//         offset: Offset(0, -300),
//         child: FloatingActionButton(
//           onPressed: () {
//             if (currentLoctation != null) {
//               mapController.move(
//                   LatLng(currentLoctation!.latitude!,
//                       currentLoctation!.longitude!),
//                   17);
//             }
//           },
//           child: const Icon(Icons.gps_fixed),
//         ),
//       ),
//     );
//   }
// }
