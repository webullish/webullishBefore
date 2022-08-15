// // ignore_for_file: require_trailing_commas

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';

// import 'models/notificationModel.dart';

// /// Message route arguments.
// class MessageArguments {
//   /// The RemoteMessage
//   final RemoteMessage message;

//   /// Whether this message caused the application to open.
//   final bool openedApplication;

//   // ignore: public_member_api_docs
//   MessageArguments(this.message, this.openedApplication);
// }

// /// Displays information about a [RemoteMessage].
// class MessageView extends StatefulWidget {
//   late notificationModel notfiy;

//   MessageView({required this.notfiy});

//   @override
//   State<StatefulWidget> createState() {
//     return Messageviewstate(notfiy: notfiy);
//   }
// }

// class Messageviewstate extends State<MessageView> {
//   late notificationModel notfiy;
//   Messageviewstate({required this.notfiy});

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final MessageArguments args =
//         ModalRoute.of(context)!.settings.arguments! as MessageArguments;
//     RemoteMessage message = args.message;
//     RemoteNotification? notification = message.notification;

//     return Scaffold(
//       appBar: AppBar(
//         title: appbar('Webullish alert'),
//       ),
//       body: SingleChildScrollView(
//           child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           children: [
//             if (notification != null) ...[
//               Padding(
//                 padding: const EdgeInsets.only(top: 16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Image.network(notfiy.image),
//                     Text(
//                       'Notification Info:',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     viewData(
//                       'Alert Name',
//                       notfiy.title,
//                     ),
//                     viewData(
//                       'Description',
//                       notfiy.body,
//                     ),
//                     viewData('Sent Time', message.sentTime?.toString()),
//                   ],
//                 ),
//               )
//             ],
//           ],
//         ),
//       )),
//     );
//   }

//   /// A single data row.
//   Widget viewData(String title, String? value) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('$title: ', style: const TextStyle(fontWeight: FontWeight.bold)),
//           Expanded(
//             child: Text(
//               value ?? 'N/A',
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget img(String? value) {
//     return Container(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(
//         elevation: 4.0,
//         child: Center(
//           child: Image.network(
//             'https://img.icons8.com/bubbles/2x/appointment-reminders.png',
//             height: 200,
//             width: 200,
//             fit: BoxFit.contain,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget appbar(String? value) {
//     return Text(
//       value ?? 'N/A',
//       style: const TextStyle(fontSize: 16),
//     );
//   }
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
