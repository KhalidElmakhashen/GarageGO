import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:legarage/core/models/notification_model.dart';
import 'package:legarage/core/services/notification_service.dart';
import 'package:legarage/core/widgets/image_back_ground_container.dart';
import 'package:legarage/features/notification/ui/widgets/notification_tiles.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      // appBar
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(color: Color(0xFF1F3171)),
        ),
        backgroundColor: Colors.transparent,
      ),

      // body
      body: Stack(
        children: [
          const ImageBackGroundContainer(
            imagePath: 'assets/images/blue_gradiant_background.png',
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            child: NotificationTiles(),
          ),
          Positioned(
            right: 8,
            bottom: 10,
            child: ElevatedButton(
              onPressed: () async {
                var box = Hive.box<NotificationModel>('notifications');
                await box.clear(); // Removes all entries
              },
              child: const Text(
                "Delete All",
                style: TextStyle(
                    color: Color(0xFF1F3171), fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
