import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:srn/Screens/placeVerification.dart';

class listOfAll extends StatefulWidget {
  const listOfAll({Key? key}) : super(key: key);

  @override
  State<listOfAll> createState() => _listOfAllState();
}

class _listOfAllState extends State<listOfAll> {

  final List<String> allCardTittle = [
    'Personal Growth',
    "Learn Meditation",
    'Peace',
    'Success',
    'Happiness',
    'Self Healing',
    'Focus',
    'Relationship',
    'Relieve Stress',
    'Motivation',
    'Breathwork',
    'Students',
    'Loving Kindness',
    'Health',
    'Before Sleep'
  ];

  final List<String> _password = [
    '1',
    "2",
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
      appBar: _appBar(),
      body:SizedBox(
        width: double.infinity,
        height: Get.height,
        child: ListView.builder(
          itemCount: allCardTittle.length,
            reverse: false,
            shrinkWrap: true,
            itemBuilder: (BuildContext context,int index ){
            return _cards(index);
            })
      ),
    ));
  }

  Widget _cards(index) {
    return ListTile(
        title: _textTittle(allCardTittle[index]) ,
        tileColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        trailing:
            Container(
              height: 50,
              padding: EdgeInsets.only(top: 10, left: 10),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Colors.red)),
              child: InkWell(
                onTap: () {
                  Get.to(placeVerification(allCardTittle[index], _password[index]));
                },
                child: Icon(
                  Icons.navigate_next_sharp,
                  color: Colors.white,
                ),
              ),
            )

        );
  }
}

Widget _textTittle(tittle) {
  return
      Text(
        '$tittle',
        style: TextStyle(
            fontSize: 20,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),
      );
}

AppBar _appBar() {
  return AppBar(
    title: const Text("near malls/hospitals"),
    elevation: 0,
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
    titleSpacing: 20,
  );
}
