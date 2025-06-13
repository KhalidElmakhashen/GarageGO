import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legarage/core/helpers/constants.dart';
import 'package:legarage/core/helpers/shared_pref_helper.dart';
import 'package:legarage/features/current_page/ui/widget/camera_photage.dart';
import 'package:legarage/features/current_page/ui/widget/current_cost_card.dart';
import 'package:legarage/core/widgets/custom_expansion_tiles.dart';
import 'package:legarage/features/current_page/ui/widget/custom_timer.dart';
import 'package:legarage/features/current_page/ui/widget/nearest_way.dart';
import 'package:legarage/features/current_page/ui/widget/spot_details_card.dart';
import 'package:legarage/main.dart';
import 'package:signalr_netcore/http_connection_options.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

class IsReservedTrue extends StatefulWidget {
  final String? time;
  IsReservedTrue({super.key, this.time});

  @override
  State<IsReservedTrue> createState() => _IsReservedTrueState();
}

class _IsReservedTrueState extends State<IsReservedTrue> {


  late HubConnection _connection;
  var spot;
  bool isConnected = false;



  Future<String> retrieveUserToken() async {
    String userToken = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    return userToken;
  }


  @override
  void initState() {
    super.initState();
    _startSignalRConnection();
  }

  Future<void> _startSignalRConnection() async {
    _connection = HubConnectionBuilder()
        .withUrl(
      "https://ispot.runasp.net/parkingHub", options:
      HttpConnectionOptions(
        accessTokenFactory: () async => await retrieveUserToken(),
      ),
    ).build();

    _connection.on('ReceiveSpot', (arguments) {
      print(spot);
    showNotification(
    "New Spot Assigned!",
    "Your reserved spot is: $spot",
  );
      setState(() {
        spot = arguments![0];
      });
    });


    try {
    await _connection.start()!.then((_)=> print("signalR is contected"));
    setState(() {
      isConnected = true;
    });
    // print('Connected to SignalR');
    }catch (E){
      print("the error is $E");
    }
  }

  // Future<void> _sendMessage() async {
  //   if (_controller.text.isEmpty) return;
  //   await _connection.invoke('SendMessage', args: ['FlutterUser', _controller.text]);
  //   _controller.clear();
  // }

  // @override
  // void dispose() {
  //   _connection.stop();
  //   super.dispose();
  // }


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
            CustomExpantionTiles(
              title: "Current Spot Details",
              child: SpotDetailsCard(
                garageName: "iSpot",
                location: "Domyat Elgideda / Elmarkaziya / 3alfa7m restorant",
                avgPrice: '15/h',
                slotNo: spot ?? '...',
                floorNO: '4',
                buildingNo: '2',
                vichelType: 'Car (suv)',
              ),
            ),
            
             SizedBox(
              height: 20.h,
            ),
            
            isConnected
                ? SizedBox.shrink()
                : Center(child: Text("Waiting for connection...")),

             SizedBox(
              height: 20.h,
            ),
            
            // Timer for Remaining Time
             CustomTimer(time: widget.time),

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