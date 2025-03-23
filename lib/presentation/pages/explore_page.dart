import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  PanelController panelController = PanelController();

  void togglePanel() => panelController.isPanelOpen
      ? panelController.close() : panelController.open() ;

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: panelController,
      panelSnapping: false,
      minHeight: MediaQuery.of(context).size.height * 0.08,
      maxHeight: MediaQuery.of(context).size.height * 0.2,
      color: Theme.of(context).colorScheme.inversePrimary,
      parallaxEnabled: true,
      parallaxOffset: .8,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      body: MyMap(),
      panelBuilder: (sc) {
        return ListView(
          padding: EdgeInsets.zero,
          controller: sc,
          children: [
            GestureDetector(
              onTap: togglePanel,
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Container(
                      height: 5,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      "Find Your Spot",
                      style: TextStyle(
                          fontSize: 36,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            const Padding(
              padding: const EdgeInsets.all(12.0),
              child: SearchBar(
                leading: Icon(Icons.search),
                hintText: "Search For a Spot?",
              ),
            )
          ],
        );
      },
    );
  }
}

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  final MapController mapController = MapController();
  LocationData? currentLoctation;
  List<LatLng> routePoints = [LatLng(8.681495, 49.41461)];
  List<Marker> markers = [];
  final String orsApiKey =
      '5b3ce3597851110001cf62481079c23e6e3c4c7d919cb5f5e555d8a0';

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  Future<void> _getCurrentLocation() async {
    var location = Location();

    try {
      var userLocation = await location.getLocation();
      setState(() {
        currentLoctation = userLocation;
        markers.add(Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng(userLocation.latitude!, userLocation.longitude!),
            child: const Icon(Icons.my_location)));
      });
    } on Exception {
      currentLoctation = null;
    }

    location.onLocationChanged.listen((LocationData newLocation) {
      setState(() {
        currentLoctation = newLocation;
      });
    });
  }

  Future<void> _getRoute(LatLng destination) async {
    if (currentLoctation == null) return;

    final start =
        LatLng(currentLoctation!.latitude!, currentLoctation!.longitude!);
    final response = await http.get(Uri.parse(
        'https://api.openrouteservice.org/v2/directions/driving-car?api_key=5b3ce3597851110001cf62481079c23e6e3c4c7d919cb5f5e555d8a0&start=${start.latitude},${start.longitude}&end=${destination.latitude},${destination.longitude}'));
    /*
                'https://api.openrouteservice.org/v2/directions/driving-car?api_key=5b3ce3597851110001cf62481079c23e6e3c4c7d919cb5f5e555d8a0&start=8.681495,49.41461&end=8.687872,49.420318'

                'https://api.openrouteservice.org/v2/directions/driving-car?api_key=5b3ce3597851110001cf62481079c23e6e3c4c7d919cb5f5e555d8a0&start=${start!.latitude!},${start!.longitude!}&end=${destination!.latitude!},${destination!.longitude}'

         */
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> coords =
          data['features'][0]['geometry']['coordinates'];
      setState(() {
        routePoints = coords
            .map((coord) => LatLng(coord[1].toDouble(), coord[0].toDouble()))
            .toList();
        markers.add(Marker(
          width: 80,
          height: 80,
          point: destination,
          child: const Icon(Icons.location_on),
        ));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed To Fetch The Route!!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _addDestinationMarker(LatLng point) {
    setState(() {
      markers.add(Marker(
        width: 80,
        height: 80,
        point: point,
        child: const Icon(Icons.location_on),
      ));
    });
    _getRoute(point);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body
      body: currentLoctation == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialZoom: 16,
                initialCenter: LatLng(
                    currentLoctation!.latitude!, currentLoctation!.longitude!),
                onTap: (tapPosition, point) => _addDestinationMarker(point),
              ),
              children: [
                  TileLayer(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: const ['a', 'b', 'c'],
                  ),
                  MarkerLayer(markers: markers),
                  PolylineLayer(polylines: [
                    Polyline(
                        points: routePoints,
                        strokeWidth: 4.0,
                        color: Colors.black)
                  ])
                ]),
      floatingActionButton: Transform.translate(
        offset: Offset(0, -30),
        child: FloatingActionButton(
          onPressed: () {
            if (currentLoctation != null) {
              mapController.move(
                  LatLng(currentLoctation!.latitude!,
                      currentLoctation!.longitude!),
                  17);
            }
          },
          child: const Icon(Icons.gps_fixed),
        ),
      ),
    );
  }
}
