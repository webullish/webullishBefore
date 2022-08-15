import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:webullish/Auth/view/Login.dart';
//import 'package:webullish/main.dart';
//import 'package:webullish/main.dart';
import 'package:webullish/notification_details.dart';
import 'package:webullish/notification_list.dart';
import 'package:webullish/pages/performane.dart';
import 'package:webullish/pages/maincontainer.dart';
import 'package:webullish/pages/notificationn.dart';
import 'package:webullish/view/notifydetails.dart';
import 'package:webullish/view/notifylist.dart';
import 'package:webullish/webullishwebview.dart';
import 'package:webullish/pages/form.dart';
import 'pages/character_listing_screen.dart';

//import 'package:webullish/webullish_firebase.dart';

class Botton extends StatefulWidget {
  const Botton({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BottonState createState() => _BottonState();
}

class _BottonState extends State<Botton> {
  final items = const [
    Icon(
      Icons.account_tree_rounded,
      size: 20,
      color: Colors.amber,
    ),
    Icon(
      Icons.checklist_sharp,
      size: 20,
      color: Colors.amber,
    ),
    Icon(
      Icons.add_home_work_sharp,
      size: 20,
      color: Colors.amber,
    ),
    Icon(
      Icons.reply_all_rounded,
      size: 20,
      color: Colors.amber,
    ),
    Icon(
      Icons.restore_page,
      size: 20,
      color: Colors.amber,
    ),
  ];

  int index = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        onTap: (selctedIndex) {
          setState(() {
            index = selctedIndex;
          });
        },
        height: 50,
        backgroundColor: Colors.blue,
        animationDuration: const Duration(milliseconds: 300),
        // animationCurve: ,
      ),
      body: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: getSelectedWidget(index: index)),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = performance();
        break;
      case 1:
        widget = notifylist();
        break;
      case 2:
        widget = maincontainer();
        break;
      case 3:
        widget = form();
        break;
      default:
        widget = MyApp();
        break;
    }
    return widget;
  }
}
