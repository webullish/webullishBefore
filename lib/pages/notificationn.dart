// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:webullish/models/notificationModel.dart';

// import '../main.dart';
// import '../notification_details.dart';
// import '../notification_list.dart';

// /// Entry point for the example application.
// class MessagingExampleApp extends StatelessWidget {
//   const MessagingExampleApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Messaging Example App',
//       theme: ThemeData.light(),
//       routes: {
//         '/': (context) => const Application(),
//         // '/message': (context) =>  MessageView(),
//       },
//     );
//   }
// }

// /// Renders the example application.
// class Application extends StatefulWidget {
//   const Application({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _Application();
// }

// class _Application extends State<Application> {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

//   void getToken() async {
//     final token =
//         _firebaseMessaging.getToken().then((value) => print('Token: $value'));
//   }

//   @override
//   void initState() {
//     super.initState();
//     getToken();

//     FirebaseMessaging.instance
//         .getInitialMessage()
//         .then((RemoteMessage? message) {
//       if (message != null) {
//         Navigator.pushNamed(
//           context,
//           '/message',
//           arguments: MessageArguments(message, true),
//         );
//       }
//     });

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;
//       if (notification != null && android != null && !kIsWeb) {
//         flutterLocalNotificationsPlugin.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               channel.id,
//               channel.name,
//               // channel.description,

//               // TODO add a proper drawable resource to android, for now using
//               //      one that already exists in example app.
//               icon: 'launch_background',
//             ),
//           ),
//         );
//       }
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print('A new onMessageOpenedApp event was published!');
//       Navigator.pushNamed(
//         context,
//         '/message',
//         arguments: MessageArguments(message, true),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: EdgeInsets.only(top: 20),
//         child: Column(
//           children: const [
//             Padding(
//               padding: EdgeInsets.all(16),
//               child: Center(
//                 child: Text(
//                   'Notifications List',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             MessageList(),
//           ],
//         ),
//       ),
//     );
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
