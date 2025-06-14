import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:legarage/core/models/notification_model.dart';
import 'package:legarage/features/notification/ui/widgets/slide_action.dart';

// ignore: must_be_immutable
class NotificationTiles extends StatelessWidget {
  const NotificationTiles({super.key});

  @override
  Widget build(BuildContext context) {
    final Box<NotificationModel> box =
        Hive.box<NotificationModel>('notifications');

    return ValueListenableBuilder<Box<NotificationModel>>(
      valueListenable: box.listenable(),
      builder: (context, box, _) {
        final notifications = box.values.toList().reversed.toList();

        if (notifications.isEmpty) {
          return const Center(child: Text('No Notification Yet'));
        }

        return ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final n = notifications[index];
            return Dismissible(
              key: Key(n.key.toString()),
              movementDuration: const Duration(milliseconds: 300),
              resizeDuration: const Duration(milliseconds: 500),
              dismissThresholds: const {
                DismissDirection.startToEnd: 0.2,
                DismissDirection.endToStart: 0.4, 
              },
              background: SlideAction(
                color: Colors.blue[200]!,
                icon: Icons.delete_forever,
                label: 'delete',
                alignment: Alignment.centerRight,
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) async {
                await n.delete();
              },
              child: Card(
                color: Colors.white,
                child: ListTile(
                  title: Text(n.title),
                  subtitle: Text(n.body),
                  trailing:
                      Text(DateFormat('dd/MM – HH:mm').format(n.timestamp)),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
