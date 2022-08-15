import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class resetpassword extends StatelessWidget {
  final email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Image.asset('assets/images/login.png'),
          SizedBox(
            height: 25,
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
          SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () async {
              try {
                final credential = await FirebaseAuth.instance
                    .sendPasswordResetEmail(email: email.text.trim());
              } on FirebaseAuthException catch (e) {
                if (e.code == 'invalid-email') {
                  print('No user found for that email.');
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
                  'submit',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                )),
          ),
        ]),
      ),
    );
  }
}
