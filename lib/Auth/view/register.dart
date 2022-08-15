import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webullish/Auth/view/Login.dart';
import 'package:webullish/Auth/view/verfiy.dart';

class register extends StatelessWidget {
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String em = 'Email ID..';

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset(
                'assets/images/signup.png',
                width: size.width,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  'Please register with the same email and password that was added in your payment information.',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.abc),
                    hintText: "Full Name..",
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
                child: TextFormField(
                  controller: email,
                  decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: em,
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
                    prefixIcon: Icon(Icons.password),
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
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () async {
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: email.text,
                      password: password.text,
                    );
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => VerifyScreen()));
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
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
                      'Sign Up',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    )),
              ),
            ],
          )),
    );
  }
}
