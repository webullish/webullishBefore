import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webullish/Auth/view/register.dart';
import 'package:webullish/Auth/view/resetpassword.dart';
import 'package:webullish/webullisbotton.dart';
import 'package:webullish/webullishwebview.dart';

class login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return loinstate();
  }
}

class loinstate extends State<login> {
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        Get.to(Botton());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset(
                'assets/images/login.png',
                width: size.width,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: email,
                  decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email ID..",
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  controller: password,
                  decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.password_sharp),
                    hintText: "Password..",
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(resetpassword());
                },
                child: Container(
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forget password',
                      style: TextStyle(color: Colors.blue),
                    )),
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () async {
                  try {
                    final credential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email.text.trim(),
                            password: password.text.trim());
                    Get.to(Botton());
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                    }
                  }
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: size.width * 0.7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    )),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('New To Webullish ? '),
                    InkWell(
                      onTap: () {
                        Get.to(register());
                      },
                      child: Text('Register Now ',
                          style: TextStyle(color: Colors.blue)),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
