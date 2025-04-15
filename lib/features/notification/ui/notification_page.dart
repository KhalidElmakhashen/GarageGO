import 'package:flutter/material.dart';
import 'package:legarage/core/widgets/notification_tiles.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(color: Theme.of(context).colorScheme.surface),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return NotificationTiles(
            title: "Ramadan Kareem",
            leading: index + 1,
            color: index % 2 == 0 ? Theme.of(context).colorScheme.inversePrimary : Theme.of(context).colorScheme.primary,
          );
        },
      ),
    );
  }
}
