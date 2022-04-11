import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:photo_view/photo_view.dart';

class insideMAp extends StatefulWidget {
  String _selected;

  insideMAp(this._selected);

  @override
  State<insideMAp> createState() => _insideMApState();
}

class _insideMApState extends State<insideMAp> {

  IconData _mainicon = Icons.keyboard_arrow_down_sharp;

  final _mapIndentifier = {
    '1': 'Personal Growth',
    "2": "Learn Meditation",
    '3': 'Peace',
    '4': 'Success',
    '5': 'Happiness',
  };

  List<String> _maps = [ 'https://www.nicklauschildrens.org/NCH/media/img/general/nicklaus-childrens-main-campus-map2018.png',
  ];

  static List<IconData> _icon = <IconData>[
    Icons.arrow_left,
    Icons.arrow_drop_up,
    Icons.arrow_right,
    Icons.arrow_drop_down
  ];

  var fromTop= Get.height * 0.03;
  var fromleft= Get.width * 0.25;
  var fromright= Get.width * 0.78;
  var fromdown= Get.height * 0.98;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: _appBar(_mapIndentifier[widget._selected]),
            body: Container(
                height: Get.height,
                width: Get.width,
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    PhotoView(
                      //imageProvider: AssetImage("assets/large-image.jpg"),
                      imageProvider: NetworkImage(
                          'https://www.nicklauschildrens.org/NCH/media/img/general/nicklaus-childrens-main-campus-map2018.png'),
                    ),
                    Positioned(
                      left: fromleft,
                      top: fromTop,
                      child: InkWell(
                        onTap: () {},
                        onDoubleTap: () {},
                        child: Icon(
                          _mainicon,
                          color: Colors.red,
                          size: 60,
                        ),
                      ),
                    ),
                  ],
                )),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniEndFloat,
            floatingActionButton: Stack(fit: StackFit.expand, children: [
              Positioned(
                left: 30,
                bottom: 20,
                child: _buttons(_icon[0],0),
              ),
              Positioned(
                bottom: 20,
                right: 30,
                child: _buttons(_icon[2],2),
              ),
              Positioned(
                bottom: 20,
                left: 100,
                child: _buttons(_icon[1],1),
              ),
              Positioned(
                bottom: 20,
                right: 100,
                child: _buttons(_icon[3],3),
              ),
            ])));
  }

  Widget _buttons(icon,did) {
    return FloatingActionButton(
      backgroundColor: Colors.transparent,
      elevation: 0,
      heroTag: 'next',
      onPressed: () {
       switch(did){
         case 0: _leftAct(); break;
        case 1: _topAct(); break;
         case 2: _rigtAct();break;
         case 3: _downAct();break;
       }
      },
      child: Icon(
        icon,
        size: 60,
        color: Colors.white24,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  void _leftAct(){
    setState(() {
      fromleft = fromleft - 10;
      _mainicon = Icons.keyboard_arrow_left_sharp;
    });
  }
  void _rigtAct(){
    setState(() {
      fromleft = fromleft + 10;
      _mainicon = Icons.keyboard_arrow_right_sharp;
    });
  }
  void _topAct(){
    setState(() {
      fromTop = fromTop - 10;
      _mainicon = Icons.keyboard_arrow_up_sharp;
    });
  }
  void _downAct(){
    setState(() {
      fromTop = fromTop + 10;
      _mainicon = Icons.keyboard_arrow_down_sharp;
    });
  }

}

AppBar _appBar(name) {
  return AppBar(
    title: Text(name),
    elevation: 0,
    backgroundColor: Colors.black,
    actions: [
      InkWell(
        onTap: () {},
        child: Icon(Icons.share),
      )
    ],
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
    titleSpacing: 20,
  );
}
