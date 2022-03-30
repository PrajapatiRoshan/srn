import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:srn/homePage.dart';

class AuthServices {
  final auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();



  void loginUser(context) async {
    try {
      await auth
          .signInWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) {
        print("User is logged in");
        Get.to(HomeScreen());
      });
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(
                child: Text("Error message"),
              ),
              content: Text(e.toString()),
            );
          });
    }
  }

  void RegisterUser(context) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) {
        print("User is register");
        //Get.to();
        Get.to(HomeScreen());
        //Get.off(context);
      });
    } catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(
                child: Text("Error message"),
              ),
              content: Text(e.toString()),
            );
          });
    }
  }
}
