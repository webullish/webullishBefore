import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class firstAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl:
            'https://webullish.com/home-1/login/?redirect_to=https%3A%2F%2Fwebullish.com%2F&fbclid=IwAR2zZJ-RJFMQIcvFb694hE9sCTP8_wdW-l8-umIEH7dyH2bXXzBBKY2LfqY/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
