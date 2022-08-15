import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webullish/Auth/loginWebview.dart';
import 'package:webullish/Auth/view/Login.dart';
import 'package:webullish/pages/acheviements.dart';
import 'package:webullish/pages/performane.dart';

import 'package:webullish/webullishwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';

class maincontainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Image.asset(
                'assets/images/webullishlogo.png',
                width: 120,
              ),
              Container(
                color: Colors.grey[100],
                height: size.height,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Choose your area',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.blue[500],
                              borderRadius: BorderRadius.circular(15)),
                          height: size.height * 0.18,
                          width: size.width * 0.4,
                          margin: EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () => Get.to(Home()),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.home_sharp,
                                  size: 45,
                                  color: Colors.amber[500],
                                ),
                                Text(
                                  "Home",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          height: size.height * 0.18,
                          width: size.width * 0.4,
                          margin: EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () => Get.to(performance()),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.request_page_outlined,
                                  size: 45,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "Performance",
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          height: size.height * 0.18,
                          width: size.width * 0.4,
                          margin: EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () => Get.to(firstAuth()),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.login_outlined,
                                  size: 45,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "Login",
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          height: size.height * 0.18,
                          width: size.width * 0.4,
                          margin: EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () => Get.to(joinus()),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.join_inner_outlined,
                                  size: 45,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "Join Us Today",
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          height: size.height * 0.18,
                          width: size.width * 0.4,
                          margin: EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () => Get.to(freetrial()),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.free_cancellation_outlined,
                                  size: 45,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "Free Trial",
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          height: size.height * 0.18,
                          width: size.width * 0.4,
                          margin: EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () => Get.to(Alertpage()),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.pages_sharp,
                                  size: 45,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "Alert Page",
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          height: size.height * 0.18,
                          width: size.width * 0.4,
                          margin: EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () => Get.to(Faq()),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.login_outlined,
                                  size: 45,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "FAQ",
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          height: size.height * 0.18,
                          width: size.width * 0.4,
                          margin: EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () => Get.to(acheviements()),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.join_inner_outlined,
                                  size: 45,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "ACheviments",
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        Get.to(login());
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: size.width * 0.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue),
                          child: Text(
                            'Sign Out',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class joinus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl:
            'https://webullish.com/membership-account/membership-checkout/?level=1&fbclid=IwAR1szKczC_qz9-eLxwP5Ddkk4ZgYsMYxwGx9tJ3pBx4Snw9CawDybkrP2eE',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class freetrial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl:
            'https://webullish.com/membership-account/membership-checkout/?level=3',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class Alertpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl:
            'https://webullish.com/groups/webullish/forum/?fbclid=IwAR1ejv9wDhPH_JBi3nJrJIhKgAXPOviYrNUp8FCZnKblSkHqcRT4aWrl5aE',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class Faq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl:
            'https://webullish.com/faq/?fbclid=IwAR2QMFyoKpAbrPhtrOgv2B2b9amOjpNy7Gy6zXfgtq9tWMVcaUQmerT6k9s',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
