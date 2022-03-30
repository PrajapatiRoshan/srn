import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _home();
}

class _home extends State<HomeScreen> {
  var fromTop = 20.0;
  Timer ? _time;
  @override
  double changing() {

     _time = Timer(
        Duration(
          seconds: 2,
        ), () {
      setState(() {
         fromTop!= 1460.0? fromTop = fromTop + 10.0 : fromTop = fromTop;
      });
    });
    return fromTop;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _appBar(),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Positioned(
                    left: Get.width * 0.37,
                    top: changing(),
                    child: InkWell(
                      onTap: (){
                        _time?.cancel();
                      },
                      onDoubleTap: (){
                        changing();
                      },
                      child: Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Colors.green,
                        size: 50,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 30,
                        width: 70,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Colors.red),
                        child: const Text("Enter"),
                      ),
                      _giveSpace(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              zoneCreator(0.37, 70.0, Colors.red, "Rest Room"),
                              _giveSpace(),
                              zoneCreator(0.37, 100.0, Colors.red, "ICU 1"),
                              _giveSpace(),
                              zoneCreator(0.37, 120.0, Colors.red, "ICU 2"),
                              _giveSpace(),
                              zoneCreator(
                                  0.37, 210.0, Colors.red, "Laboratory"),
                              _giveSpace(),
                              zoneCreator(0.37, 250.0, Colors.red, "Storage"),
                              _giveSpace(),
                              zoneCreator(
                                  0.37, 200.0, Colors.red, "Administration"),
                              _giveSpace(),
                              zoneCreator(0.37, 100.0, Colors.red,
                                  "Ambulance\n Gateway"),
                              _giveSpace(),
                              zoneCreator(0.30, 70.0, Colors.red, "Medical"),
                            ],
                          ),
                          SizedBox(
                            width: Get.width * 0.15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              zoneCreator(0.48, 180.0, Colors.red,
                                  "Emergency \n department"),
                              _giveSpace(),
                              zoneCreator(
                                  0.48, 150.0, Colors.red, "waiting \n Room"),
                              _giveSpace(),
                              zoneCreator(
                                  0.48, 70.0, Colors.red, "Supply chain"),
                              _giveSpace(),
                              zoneCreator(
                                  0.48, 70.0, Colors.red, "Nurse Station"),
                              _giveSpace(),
                              zoneCreator(0.48, 70.0, Colors.red, "Food room"),
                              _giveSpace(),
                              zoneCreator(
                                  0.48, 130.0, Colors.red, "Doctor \n office"),
                              _giveSpace(),
                              zoneCreator(0.48, 140.0, Colors.red, "Surgery"),
                              _giveSpace(),
                              zoneCreator(0.48, 200.0, Colors.red, "Rest room"),
                              _giveSpace(),
                              zoneCreator(
                                  0.40, 70.0, Colors.red, "Security \n office"),
                            ],
                          )
                        ],
                      ),
                      _giveSpace(),
                      Container(
                        height: 30,
                        width: 70,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Colors.red),
                        child: const Text("Exit"),
                      )
                    ],
                  )
                ],
              ),
            )));
  }
}

AppBar _appBar() {
  return AppBar(
    title: const Text("Hospital inside Map"),
    elevation: 0.4,
    backgroundColor: Colors.amberAccent,
  );
}

Widget zoneCreator(wd, hg, color, text) {
  return Container(
    width: Get.width * wd,
    height: hg,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: color,
    ),
    child: Text(
      text,
      style: const TextStyle(fontSize: 18, color: Colors.black),
    ),
  );
}

Widget _giveSpace() {
  return const SizedBox(
    height: 40,
  );
}
