import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legarage/core/helpers/constants.dart';
import 'package:legarage/core/helpers/extensions.dart';
import 'package:legarage/core/helpers/shared_pref_helper.dart';

import 'package:legarage/core/widgets/image_back_ground_container.dart';
import 'package:legarage/features/current_page/logic/delete_reservation_cubit/delete_reservation_cubit.dart';
import 'package:legarage/features/current_page/ui/widget/current_page_listner.dart';
import 'package:legarage/features/current_page/ui/widget/is_reserved_false.dart';
import 'package:legarage/features/current_page/ui/widget/is_reserved_true.dart';

class CurrentPage extends StatefulWidget {
  const CurrentPage({super.key});

  @override
  State<CurrentPage> createState() => _CurrentPageState();
}

class _CurrentPageState extends State<CurrentPage> {
  checkIfIsReserved() async {
    String? reservationId =
        await SharedPrefHelper.getString(SharedPrefKeys.reservationId);
    if (!reservationId.isNullOrEmpty()) {
      isReserved = true;
    } else {
      isReserved = false;
    }
  }

  Future<String> checkOrStartTime() async {
    String? startTime =
       await SharedPrefHelper.getString(SharedPrefKeys.reservationtime);
    if (startTime != null) {
      DateTime startDateTime = DateTime.parse(startTime);
      DateTime startTimePluse10 = startDateTime.add(const Duration(minutes: 10));
      DateTime currentDateTime = DateTime.now();
      Duration difference = startTimePluse10.difference(currentDateTime);
      if (difference.isNegative) {
        return '';
      } else {
        return difference.toString();
      }
    } else {
      return '';
    }
  }

  String? time;

  @override
  void initState() {
    super.initState();
    checkIfIsReserved().whenComplete(() => setState(() {}));
    checkOrStartTime().then((time) { 
      if (time.isNotEmpty) {
        this.time = time;
      } else {
        this.time = null;
      }
      setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Spot Detials',
          style: TextStyle(color: Color(0xFF1F3171)),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          const CurrentPageListner(),
          const ImageBackGroundContainer(
            imagePath: 'assets/images/blue_gradiant_background.png',
          ),
          isReserved ?  IsReservedTrue(time: time ,) : const IsReservedFalse(),
        ],
      ),
    );
  }
}
