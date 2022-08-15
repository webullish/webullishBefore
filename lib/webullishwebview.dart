// ignore: file_names

// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<Home> {
  late WebViewController controller;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              initialUrl: 'https://www.webullish.com/',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                this.controller = controller;
              },
              onPageStarted: (url) {
                // ignore: avoid_print
                print('page Started : $url');
                Future.delayed(const Duration(milliseconds: 1000), () {
                  setState(() {
                    isLoading = false;
                  });
                });
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
            if (isLoading)
              const Center(
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(),
                ),
              )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     print('object');
      //     final urlCurrent = await controller.currentUrl();
      //     // ignore: avoid_print
      //     print('current url $urlCurrent');
      //     controller.loadUrl(
      //       'https://webullish.com/groups/webullish/forum/',
      //     );
      //   },
      //   child: const Icon(Icons.add_alert_outlined, size: 15),
      // ),
    );
  }
}

class HomeState extends StatefulWidget {
  const HomeState({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
