// // services/socket_service.dart

// import 'dart:developer';

// import 'package:food_recipes_afame/services/local_storage_service.dart';
// import 'package:get/get.dart';
// import 'package:socket_io_client/socket_io_client.dart' as io;

// class SocketService {
//   late io.Socket socket;
//   final _messageStream = RxnString();

//   RxnString get messageStream => _messageStream;

//   final String socketUrl = 'http://10.0.2.2:8060';

//   Future<void> connect() async {
//     String token = await LocalStorageService().getToken() ?? "";
//     log(token);

//     if (token.isNotEmpty) {
//       print('🟢 Connecting to socket with authorization token...$token');
//       socket = io.io(
//         'http://10.10.10.30:8060',
//         io.OptionBuilder()
//             .setTransports(['websocket'])
//             .enableAutoConnect().enableForceNew()
//             .setExtraHeaders({'authorization': token}) // optional
//             .build(),
//       );

//       socket.onConnect((data) {
//         log("=============================> Connection $data");
//       });
//       socket.onConnectError((data) {
//         log("============================>Connection Error $data");
//       });

//       socket.connect();
//     } else {
//       print('⚠️ No token found, skipping socket connection.');
//     }
//   }

//   void disconnect() {
//     print('⚠️ Disconnecting socket...');
//     socket.disconnect();
//   }
// }
