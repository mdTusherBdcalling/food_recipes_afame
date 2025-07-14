// import 'package:get/get.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';

// class NotificationController extends GetxController {
//   final RxList<Map<String, String>> notifications = <Map<String, String>>[].obs;
//   late WebSocketChannel channel;

//   @override
//   void onInit() {
//     super.onInit();
//     _connectWebSocket();
//   }

//   void _connectWebSocket() {
//     channel = WebSocketChannel.connect(
//       Uri.parse('ws://10.10.10.30:8060'), // Use ws:// for unsecure, wss:// for secure
//     );

//     channel.stream.listen(
//       (data) {
//         print('📩 Received: $data');

//         // Convert data to map if it's JSON, or assume simple string
//         notifications.insert(0, {
//           'message': data.toString(),
//           'time': DateTime.now().toLocal().toString().substring(0, 16),
//         });
//       },
//       onDone: () {
//         print('🔌 WebSocket connection closed');
//       },
//       onError: (error) {
//         print('❗ WebSocket error: $error');
//       },
//     );
//   }

//   @override
//   void onClose() {
//     channel.sink.close();
//     super.onClose();
//   }
// }
