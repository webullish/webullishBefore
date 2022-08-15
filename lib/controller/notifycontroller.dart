import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/notificationModel.dart';

class notifycontroller extends GetxController {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final user = FirebaseAuth.instance.currentUser;
  List<notificationModel> _messages = [];
  List<notificationModel> get listmessages => _messages;

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  notifycontroller() {
    getnotify();
    init();
  }
  void getToken() async {
    final token =
        _firebaseMessaging.getToken().then((value) => print('Token: $value'));
  }

  init() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      addnotify(notificationModel(
          subtitle: DateTime.now().toString(),
          body: message.notification!.body.toString(),
          image: message.notification!.android!.imageUrl.toString(),
          title: message.notification!.title.toString()));

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
    update();
  }

  addnotify(notificationModel model) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    await db
        .collection('notification')
        .doc(user!.uid)
        .collection('notification2')
        .add(model.tojson());
    update();
  }

  getnotify() async {
    _loading.value = true;
    FirebaseFirestore db = FirebaseFirestore.instance;
    await db
        .collection('notification')
        .doc(user!.uid)
        .collection('notification2')
        .get()
        .then((value) => {
              if (value.docs == null)
                {}
              else
                {
                  for (int i = 0; i < value.docs.length; i++)
                    {
                      _messages.add(
                          notificationModel.fromjson(value.docs[i].data())),
                      print(value.docs[i].data()),
                      print('#############################################')
                    },
                  _loading.value = false
                },
            });
    update();
  }
}
