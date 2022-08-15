import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webullish/binding/binding.dart';
import 'package:webullish/firebase_config.dart';

import 'package:webullish/firebase_options.dart';
import 'package:webullish/Auth/view/Login.dart';
import 'package:webullish/webullisbotton.dart';
import 'package:webullish/webullishwebview.dart';
//import 'package:webullish/view/onboarding_page.dart';
import 'models/notificationModel.dart';
import 'view/onboarding_page.dart';
import 'notification_details.dart';
import 'notification_list.dart';

int? isviewed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: binding(),
      title: 'Webullish',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Colors.blue),
      // ignore: unnecessary_const
      home: isviewed != 0 ? PageOnBorarding() : login(),
    );
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.notification!.title}");
  addnotify(notificationModel(
      subtitle: DateTime.now().toString(),
      body: message.notification!.body.toString(),
      image: message.notification!.android!.imageUrl.toString(),
      title: message.notification!.title.toString()));
}

AndroidNotificationChannel channel = const AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.high,
);
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
final user = FirebaseAuth.instance.currentUser;
addnotify(notificationModel model) async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  await db
      .collection('notification')
      .doc(user!.uid)
      .collection('notification2')
      .add(model.tojson());
}


//   return Scaffold(
//     // ignore: avoid_unnecessary_containers
//     body: Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: const [
//           Text("Hello"),
//         ],
//       ),
//     ),
//   );
// }

// /// Define a top-level named handler which background/terminated messages will
// /// call.
// ///
// /// To verify things are working, check out the native platform logs.
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
//   // ignore: avoid_print
//   print('Handling a background message ${message.messageId}');
// }

// /// Create a [AndroidNotificationChannel] for heads up notifications
// late AndroidNotificationChannel channel;

// /// Initialize the [FlutterLocalNotificationsPlugin] package.
// late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

// Future<void> mainapp() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     name: 'YourAPP',

//     /// ToDO change your data ///
//     options: const FirebaseOptions(
//       apiKey: 'AIzaSyDbBh0q-IBQg0EryLYonwsP24iH4G6qh9U',
//       appId: '1:708892247921:android:e9e2b999a7e537f82898d0',
//       messagingSenderId: '708892247921',
//       projectId: 'webullish-14c86',
//     ),
//   );

//   // Set the background messaging handler early on, as a named top-level function
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//   if (!kIsWeb) {
//     channel = const AndroidNotificationChannel(
//       'high_importance_channel', // id
//       'High Importance Notifications', // title
//       // 'This channel is used for important notifications.', // description
//       importance: Importance.high,
//     );

//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//     /// Create an Android Notification Channel.
//     ///
//     /// We use this channel in the `AndroidManifest.xml` file to override the
//     /// default FCM channel to enable heads up notifications.
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);

//     /// Update the iOS foreground notification presentation options to allow
//     /// heads up notifications.
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }

//   runApp(const MessagingExampleApp());
// }

// /// Entry point for the example application.
// class MessagingExampleApp extends StatelessWidget {
//   const MessagingExampleApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Messaging Example App',
//       theme: ThemeData.light(),
//       routes: {
//         '/': (context) => const Application(),
//         //  '/message': (context) =>  MessageView(),
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

//               // ignore: todo
//               // TODO add a proper drawable resource to android, for now using
//               //      one that already exists in example app.
//               icon: 'launch_background',
//             ),
//           ),
//         );
//       }
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       // ignore: avoid_print
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
//       appBar: AppBar(
//         title: const Text('Push Notifications'),
//         actions: [
//           IconButton(
//               onPressed: () {}, icon: const Icon(Icons.notifications_none))
//         ],
//       ),
//       body: SingleChildScrollView(
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


// //class _HomeState extends State<Home> {
//   //@override
//   //void initState() {
// //    super.initState();
//     //initPlatformState();
//   //}
// //}

// //import 'package:webullish/pages/character_listing_screen.dart';
// //import 'pages/character_listing_screen.dart';
// //import 'package:webullish/webullisbotton.dart';
// //import 'package:webullish/webullishWebView.dart';

// //import 'package:webview_flutter/webview_flutter.dart';
// //import 'package:firebase_messaging/firebase_messaging.dart';
// //import 'package:flutter/foundation.dart';
// //import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// //import 'package:webullish/firebase_config.dart';
// //import 'notification_details.dart';
// //import 'notification_list.dart';
// //import 'package:webullish/notification_details.dart';
// //import 'package:webullish/notification_list.dart';
// //import 'firebase_config.dart';

// //port 'package:after_layout/after_layout.dart';
// //port 'package:webullis/webullisbotton.dart';
// //port 'package:webullish/webullishScreen.dart';
// //port 'package:webullish/webullish_firebase.dart';
// //import 'pages/character_listing_screen.dart';
// //import 'notification_list.dart';