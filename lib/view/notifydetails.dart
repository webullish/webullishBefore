import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webullish/models/notificationModel.dart';

class notifydetails extends StatelessWidget {
  late notificationModel notify;
  notifydetails({required this.notify});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appbar('Webullish alert'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (notify.image != null) Image.network(notify.image),
                  Container(),
                  Text(
                    'Notification Info:',
                    style: TextStyle(fontSize: 18),
                  ),
                  viewData(
                    'Alert Name',
                    notify.title,
                  ),
                  viewData(
                    'Description',
                    notify.body,
                  ),
                  viewData('Sent Time', notify.subtitle),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

Widget viewData(String title, String? value) {
  return Padding(
    padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$title: ', style: const TextStyle(fontWeight: FontWeight.bold)),
        Expanded(
          child: Text(
            value ?? 'N/A',
          ),
        ),
      ],
    ),
  );
}

Widget appbar(String? value) {
  return Text(
    value ?? 'N/A',
    style: const TextStyle(fontSize: 16),
  );
}
