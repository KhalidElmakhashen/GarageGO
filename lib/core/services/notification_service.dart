

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import '../models/notification_model.dart';

class NotificationService {
  static final _plugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const init = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await _plugin.initialize(init);
  }

  Future<void> show({
    required String title,
    required String body,
  }) async {
    final id = DateTime.now().millisecondsSinceEpoch >> 10; // id شبه فريد
    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        'default_channel',
        'General Notifications',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );
    await _plugin.show(id, title, body, details);
    _saveToHive(title, body);
  }

  void _saveToHive(String title, String body) {
    final box = Hive.box<NotificationModel>('notifications');
    box.add(NotificationModel(
      title: title,
      body: body,
      timestamp: DateTime.now(),
    ));
  }
}
