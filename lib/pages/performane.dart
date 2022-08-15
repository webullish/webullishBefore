import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class performance extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return firststate();
  }
}

class firststate extends State<performance> {
  late WebViewController controller;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    // initState(){
    //       () async {
    //     print('object');
    //     final urlCurrent = await controller.currentUrl();
    //     // ignore: avoid_print
    //     print('current url $urlCurrent');
    //     controller.loadUrl(
    //       'https://webullish.com/groups/webullish/forum/',
    //     );
    //   };
    // }
    return Scaffold(
      body: WebView(
        initialUrl: 'https://webullish.com/performance',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
      ),
    );
  }
}
