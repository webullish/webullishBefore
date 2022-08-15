import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class form extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return urlstate();
  }
}

class urlstate extends State<form> {
  late WebViewController controller;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    initState() {
      () async {
        print('object');
        final urlCurrent = await controller.currentUrl();
        // ignore: avoid_print
        print('current url $urlCurrent');
        controller.loadUrl(
          'https://webullish.com/groups/webullish/forum/',
        );
      };
    }

    return WillPopScope(
      onWillPop: (() => _goBack(context, controller)),
      child: Scaffold(
        body: WebView(
          initialUrl: 'https://webullish.com/groups/webullish/forum/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            this.controller = controller;
          },
          onPageFinished: (url) {
            // ignore: avoid_print
            print('finished');
            controller.runJavascript(
                "document.getElementsByTagName('header')[0].style.display='none'");
            controller.runJavascript(
                "document.getElementsByTagName('footer')[0].style.display='none'");
          },
        ),
      ),
    );
  }
}

Future<bool> _goBack(BuildContext context, WebViewController controller) async {
  if (await controller.canGoBack()) {
    controller.goBack();
    return Future.value(false);
  } else {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Do you want to exit'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No'),
                ),
                FlatButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Text('Yes'),
                ),
              ],
            ));
    return Future.value(true);
  }
}
