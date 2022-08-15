// // ignore_for_file: require_trailing_commas

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:webullish/models/notificationModel.dart';
// import 'notification_details.dart';

// /// Listens for incoming foreground messages and displays them in a list.
// class MessageList extends StatefulWidget {
//   const MessageList({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _MessageList();
// }

// class _MessageList extends State<MessageList> {
//   List<notificationModel> _messages = [];
//   List<notificationModel> get listmessages => _messages;

//   @override
//   void initState() {
//     super.initState();
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       addnotify(notificationModel(
//           subtitle: message.sentTime.toString(),
//           body: message.notification!.body.toString(),
//           image: message.notification!.android!.imageUrl.toString(),
//           title: message.notification.toString()));
//       getnotify(_messages);
//       setState(() {
//         getnotify(_messages);
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_messages.isEmpty) {
//       return const Text('No messages received');
//     }

//     return ListView.builder(
//         shrinkWrap: true,
//         itemCount: _messages.length,
//         itemBuilder: (context, index) {
//           notificationModel message = _messages[index];

//           return ListTile(
//               title: Text(
//                 listmessages[index].title,
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//               subtitle: Text(listmessages[index].subtitle),
//               trailing: const Icon(
//                 Icons.notifications_active,
//                 color: Colors.red,
//               ),
//               onTap: () => Get.to(MessageView(
//                     notfiy: listmessages[index],
//                   ))
//               // arguments: MessageArguments(message, false)),
//               );
//         });
//   }
// }

// addnotify(notificationModel model) async {
//   FirebaseFirestore db = FirebaseFirestore.instance;
//   db.collection('notification').add(model.tojson());
// }

// getnotify(List<notificationModel> _messages) async {
//   FirebaseFirestore db = FirebaseFirestore.instance;
//   db.collection('notification').get().then((value) => {
//         if (value.docs == null)
//           {}
//         else
//           {
//             for (int i = 0; i < value.docs.length; i++)
//               {_messages.add(notificationModel.fromjson(value.docs[i].data()))}
//           }
//       });
// }
