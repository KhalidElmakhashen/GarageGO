import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legarage/core/helpers/constants.dart';
import 'package:legarage/core/helpers/shared_pref_helper.dart';
import 'package:legarage/features/current_page/logic/delete_reservation_cubit/delete_reservation_cubit.dart';
import 'package:slide_countdown/slide_countdown.dart';

class CustomTimer extends StatelessWidget {
  final String? time;
  const CustomTimer({super.key, this.time});

  Duration parseDuration(String timeString) {
  String beforeDot = timeString.split('.').first;  
  List<String> parts = beforeDot.split(':');
  
  if (parts.length == 3) {
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    int seconds = int.parse(parts[2]);

    return Duration(hours: hours, minutes: minutes, seconds: seconds);
  } else {
    throw FormatException("Invalid duration format. Use HH:mm:ss");
  }
}

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Theme.of(context).colorScheme.primary,
      color: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Text(
              "Remaining Time ",
              style: TextStyle(
                // color: Theme.of(context).colorScheme.inversePrimary,
                color: Color(0xFF1F3171),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SlideCountdownSeparated(
              duration: parseDuration(time ?? '00:00:00'),
              showZeroValue: true,
              onDone: () async {
                  String savedReservationId = await SharedPrefHelper.getString(SharedPrefKeys.reservationId); 
                  int reservationId = int.parse(savedReservationId);
                  context.read<DeleteReservationCubit>().deleteReservation(reservationId);
                },
              style: const TextStyle(
                  fontSize: 50,
                  color: Color(0xFF1F3171),
                  // color: Theme.of(context).colorScheme.inversePrimary
                  ),
              separatorStyle: TextStyle(
                  // color: Theme.of(context).colorScheme.inversePrimary,
                  color: Colors.blue[300],
                  fontSize: 45),
              decoration: BoxDecoration(
                // color: Theme.of(context).colorScheme.surface,
                color: Colors.blue[50]  ,
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
