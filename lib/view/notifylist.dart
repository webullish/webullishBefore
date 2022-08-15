import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webullish/controller/notifycontroller.dart';
import 'package:webullish/models/notificationModel.dart';
import 'package:webullish/view/notifydetails.dart';

class notifylist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GetBuilder<notifycontroller>(
      init: notifycontroller(),
      builder: ((controller) => controller.loading.value
          ? Center(
              child: Center(
              child: Text('No messages received'),
            ))
          : Scaffold(
              body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(10),
                height: size.height * 0.9,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.listmessages.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: (() => Get.to(notifydetails(
                          notify: notificationModel(
                              subtitle: controller.listmessages[index].subtitle,
                              title: controller.listmessages[index].title,
                              body: controller.listmessages[index].body,
                              image: controller.listmessages[index].image),
                        ))),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey[300],
                      ),
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            controller.listmessages[index].title.toString(),
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(controller.listmessages[index].title.toString()),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ))),
    );
  }
}
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:firebase_messaging/firebase_messaging.dart';

// import '../models/notificationModel.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   var tokenvlue;
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//   List<notificationModel> _messages = [];
//   List<notificationModel> get listmessages => _messages;
//   void getToken() async {
//     final token =
//         _firebaseMessaging.getToken().then((value) => print('Token: $value'));
//   }

//   @override
//   void initState() {
//     getnotify(_messages);
//     // TODO: implement initState
//     super.initState();
//     getToken();
//     print('##############################################$tokenvlue');

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print('Got a message whilst in the foreground!');
//       print('Message data: ${message.notification!.title}');
//       addnotify(
//           notificationModel(
//               subtitle: message.sentTime.toString(),
//               body: message.notification!.body.toString(),
//               image: message.notification!.android!.imageUrl.toString(),
//               title: message.notification!.title.toString()),
//           'getToken()');

//       if (message.notification != null) {
//         print('Message also contained a notification: ${message.notification}');
//       }
//     });
//   }

//   late String _email, _password;
//   final auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     if (_messages.isEmpty) {
//       return Scaffold(
//         body: Center(child: Text('No messages received')),
//       );
//     }
//     return Scaffold(
//         body: SingleChildScrollView(
//       child: Container(
//           width: 4000,
//           margin: EdgeInsets.all(10),
//           height: 800,
//           child: ListView.builder(
//             scrollDirection: Axis.vertical,
//             itemCount: _messages.length,
//             itemBuilder: (context, index) => Container(
//               height: 80,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(25),
//                 color: Colors.grey[300],
//               ),
//               margin: EdgeInsets.all(10),
//               child: Column(
//                 children: [
//                   Text(
//                     listmessages[index].title.toString(),
//                     style: TextStyle(fontSize: 17),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text(listmessages[index].title.toString()),
//                 ],
//               ),
//             ),
//           )),
//     ));
//   }
// }

// addnotify(notificationModel model, String token) async {
//   FirebaseFirestore db = FirebaseFirestore.instance;
//   await db.collection('notification').doc(token).set(model.tojson());
// }

// getnotify(List<notificationModel> _messages) async {
//   FirebaseFirestore db = FirebaseFirestore.instance;
//   await db.collection('notification').get().then((value) => {
//         if (value.docs == null)
//           {
//             print(
//                 "objectobjectobjectobjectobjectobjectobjectobjectobjectobjectobjectobjectobjectobjectobjectobject")
//           }
//         else
//           {
//             for (int i = 0; i < value.docs.length; i++)
//               {_messages.add(notificationModel.fromjson(value.docs[i].data()))}
//           }
//       });
// }
