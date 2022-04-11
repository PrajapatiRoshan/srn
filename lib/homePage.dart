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
  var fromTop = 25.0;
  Timer? _time;
  bool start = false;

  List imgPath = [
    "assets/rest_room.png",
    "assets/icu_1.png",
    "assets/icu_2.png",
    "assets/laboratory.png",
    "assets/storage.png",
    "assets/administration.png",
    "assets/ambulance_gateway.png",
    "assets/medical.png",
    "assets/emergency.png",
    "assets/waiting_room.png",
    "assets/sypply_chain.png",
    "assets/nurse_station.png",
    "assets/food_room.png",
    "assets/doctor_office.png",
    "assets/surgery_room.png",
    "assets/blood_bank.png",
    "assets/security_office.png"
  ];

  @override
  double changing() {
    _time = Timer(
        Duration(
          seconds: 2,
        ), () {
      setState(() {
        fromTop != 1460.0 ? fromTop = fromTop + 10.0 : fromTop = fromTop;
      });
    });
    return fromTop;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _appBar(),
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Positioned(
                    left: Get.width * 0.37,
                    top: changing(),
                    child: InkWell(
                      onTap: () {
                        _time?.cancel();
                      },
                      onDoubleTap: () {
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
                        height: 40,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Colors.red),
                        child: const Text(
                          "Enter",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white),
                        ),
                      ),
                      _giveSpace(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              zoneCreator(0.37, 70.0, Colors.red, "Rest Room",
                                  imgPath[0]),
                              _giveSpace(),
                              zoneCreator(
                                  0.37, 100.0, Colors.red, "ICU 1", imgPath[1]),
                              _giveSpace(),
                              zoneCreator(
                                  0.37, 120.0, Colors.red, "ICU 2", imgPath[2]),
                              _giveSpace(),
                              zoneCreator(0.37, 210.0, Colors.red, "Laboratory",
                                  imgPath[3]),
                              _giveSpace(),
                              zoneCreator(0.37, 250.0, Colors.red, "Storage",
                                  imgPath[4]),
                              _giveSpace(),
                              zoneCreator(0.37, 200.0, Colors.red,
                                  "Administration", imgPath[5]),
                              _giveSpace(),
                              zoneCreator(0.37, 100.0, Colors.red,
                                  "Ambulance\n Gateway", imgPath[6]),
                              _giveSpace(),
                              zoneCreator(0.30, 70.0, Colors.red, "Medical",
                                  imgPath[7]),
                            ],
                          ),
                          SizedBox(
                            width: Get.width * 0.15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              zoneCreator(0.48, 180.0, Colors.red,
                                  "Emergency \n department", imgPath[8]),
                              _giveSpace(),
                              zoneCreator(0.48, 150.0, Colors.red,
                                  "waiting \n Room", imgPath[9]),
                              _giveSpace(),
                              zoneCreator(0.48, 70.0, Colors.red,
                                  "Supply chain", imgPath[10]),
                              _giveSpace(),
                              zoneCreator(0.48, 70.0, Colors.red,
                                  "Nurse Station", imgPath[11]),
                              _giveSpace(),
                              zoneCreator(0.48, 70.0, Colors.red, "Food room",
                                  imgPath[12]),
                              _giveSpace(),
                              zoneCreator(0.48, 130.0, Colors.red,
                                  "Doctor \n office", imgPath[13]),
                              _giveSpace(),
                              zoneCreator(0.48, 140.0, Colors.red, "Surgery",
                                  imgPath[14]),
                              _giveSpace(),
                              zoneCreator(0.48, 200.0, Colors.red, "Blood Bank",
                                  imgPath[15]),
                              _giveSpace(),
                              zoneCreator(0.40, 70.0, Colors.red,
                                  "Security \n office", imgPath[16]),
                            ],
                          )
                        ],
                      ),
                      _giveSpace(),
                      Container(
                        height: 40,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Colors.red),
                        child: const Text(
                          "Exit",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white),
                        ),
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
    elevation: 0,
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
    titleSpacing: 20,
  );
}

Widget zoneCreator(wd, hg, color, text, impath) {
  return Container(
    width: Get.width * wd,
    height: hg,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(impath), fit: BoxFit.cover),
    ),
    child: Text(
      text,
      style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          backgroundColor: Colors.white70),
    ),
  );
}

Widget _giveSpace() {
  return const SizedBox(
    height: 40,
  );
}
