import 'package:flutter/material.dart';
import 'package:legarage/core/widgets/image_back_ground_container.dart';


class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  // make list that contain NotificationTiles and use it in the ListView.builder and when delete from the list setState to update the UI and every time you get new notification add it to the list and setState to update the UI

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(color: Theme.of(context).colorScheme.surface),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: const Stack(
        children: [
          ImageBackGroundContainer(imagePath: 
            'assets/images/2522356.jpg',
          ),
        ],
      ),
      // body: ListView.builder(
      //   itemCount: 20,
      //   itemBuilder: (context, index) {
      //     return NotificationTiles(
      //       title: "Ramadan Kareem",
      //       leading: index + 1,
      //       color: index % 2 == 0 ? Theme.of(context).colorScheme.inversePrimary : Theme.of(context).colorScheme.primary,
      //     );
      //   },
      // ),
    );
  }
}
