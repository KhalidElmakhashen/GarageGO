import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';

class CustomTimer extends StatelessWidget {
  const CustomTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              "Remaining Time ",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SlideCountdownSeparated(
              duration: const Duration(
                days: 0,
                hours: 00,
                minutes: 00,
                seconds: 100,
              ),
              showZeroValue: true,
              style: TextStyle(
                  fontSize: 50,
                  color: Theme.of(context).colorScheme.inversePrimary),
              separatorStyle: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 45),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
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
