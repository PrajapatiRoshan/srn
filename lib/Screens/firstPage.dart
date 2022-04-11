import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:srn/Screens/compass.dart';
import 'package:srn/Screens/listsOfMallHos.dart';
import 'package:srn/Screens/mapPage.dart';
import 'package:srn/homePage.dart';
import 'package:permission_handler/permission_handler.dart';

class StartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _start();
}

class _start extends State<StartPage> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: _appBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children:  <Widget>[
            _buttons("Start with your location", 1),
            SizedBox(
              height: 10,
            ),
            _buttons("Find near malls/hospitals", 2),
            SizedBox(
              height: 10,
            ),
            _buttons("Compass", 3),

          ],
        ),
      ),
    ));
  }


}


Widget _buttons(text, selc) {
  return ElevatedButton(
      onPressed: () {
        if(selc==1){Get.to(map('your location'));}else if(selc==2){Get.to(listOfAll());}else {Get.to(Compass());}
      },
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: const BorderSide(color: Colors.red)),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 24)),
    );
}

AppBar _appBar() {
  return AppBar(
    title: const Text("SRN"),
    elevation: 0,
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
    titleSpacing: 20,
  );
}




