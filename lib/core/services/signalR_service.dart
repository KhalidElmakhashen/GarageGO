

import 'dart:async';
import 'package:legarage/core/services/notification_service.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';
import 'package:signalr_netcore/http_connection_options.dart';
import 'package:legarage/core/helpers/shared_pref_helper.dart';
import 'package:legarage/core/helpers/constants.dart';

class SignalRService {
  // ــ نمط Singleton لوجود اتصال واحد فقط طوال عمر التطبيق
  static final SignalRService _instance = SignalRService._internal();
  factory SignalRService() => _instance;
  SignalRService._internal();

  late HubConnection _connection;

  // بثّ البيانات عبر Stream (Broadcast) ليستمع لها أكثر من مستقبِل
  final _spotController = StreamController<dynamic>.broadcast();
  Stream<dynamic> get spotStream => _spotController.stream;

  bool get isConnected =>
      _connection.state == HubConnectionState.Connected;

  /// تهيئة الاتصال (تُستدعى مرّة واحدة في `main`)
  Future<void> init() async {
    // تحمّل التوكن من التخزين الآمن
    final token = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.userToken);

    _connection = HubConnectionBuilder()
        .withUrl(
          // لاحِظ: استبدل بـ HTTPS في الإنتاج
          // "https://ispot.runasp.net/parkingHub",
          "http://192.168.1.6:5158/parkingHub",
          options: HttpConnectionOptions(
            accessTokenFactory: () async => token,
          ),
        )
        .withAutomaticReconnect()       // محاولة إعادة الاتصال تلقائيًا
        .build();

    // استماع لحدث ReceiveSpot
    _connection.on('ReceiveSpot', (args) {
      // args[0] يحمل رقم الموقف
      // NotificationService().show(
      //   title: '🚗 your spot is ready now',
      // body: "the reservation is ensured int spot number ${args![0]}");
      if (args?.isNotEmpty ?? false) {
        _spotController.add(args![0]);

      }
      print(args![0]);
      SharedPrefHelper.setData("spot", args![0]);
    });

    _connection.on('SendAlert', (args){
      NotificationService().show(
        title: args![0] as String,
      body: args![1] as String
      );
    });




    // فعليًّا ابدأ الاتصال
    try{await _connection.start();} catch (e) {print(e);}
  }

  Future<void> invokSpot() async {
    _connection.invoke('ReceiveSpot');
  }

  /// استدعِ هذا عند إغلاق التطبيق نهائيًا (ليس عند الخروج من شاشة)
  Future<void> dispose() async {
    await _spotController.close();
    await _connection.stop();
  }
}
