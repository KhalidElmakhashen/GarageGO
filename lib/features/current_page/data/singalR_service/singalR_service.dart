import 'package:signalr_netcore/http_connection_options.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

class SingalRService {
  late HubConnection _connection;

  Future<void> startSignalRConnection() async {
    _connection = HubConnectionBuilder()
        .withUrl(
    "https://your-api.com/parkingHub", options:
    HttpConnectionOptions(
      accessTokenFactory: () async => "JWT_TOKEN_HERE",
    ),
  )
  .build();

    _connection.on("ReceiveSpot", (args) {
      final spot = args![0];
      print("🚗 Spot assigned: $spot");
    });

    await _connection.start();
    print('Connected to SignalR');
  }

  Future<void> _sendMessage(data) async {
    await _connection
        .invoke('SendMessage', args: [data]);
  }

  Future<void> dispose() async {
    await _connection.stop();
  }

}
