// import 'package:food_recipes_afame/utils/ApiEndpoints.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// class NotificationSocketService {
//   static final NotificationSocketService _instance = NotificationSocketService._internal();
//   factory NotificationSocketService() => _instance;

//   late IO.Socket socket;

//   NotificationSocketService._internal();

//   void connect() {
//     socket = IO.io(
//       ApiEndpoints.socketBaseUrl,
//       <String, dynamic>{
//         'transports': ['websocket'],
//         'autoConnect': false,
//       },
//     );

//     socket.connect();

//     socket.onConnect((_) {
//       print('✅ Connected to socket');
//     });

//     socket.onDisconnect((_) {
//       print('❌ Disconnected from socket');
//     });

//     socket.on('eventtype-notification', (data) {
//       print('🔔 Notification received: $data');

//       // TODO: Add logic to show local notification or update UI
//     });

//     socket.onConnectError((err) => print('❗Connect error: $err'));
//     socket.onError((err) => print('❗Error: $err'));
//   }

//   void disconnect() {
//     socket.disconnect();
//   }
// }
