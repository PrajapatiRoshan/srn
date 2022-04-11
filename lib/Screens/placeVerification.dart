import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:srn/listOfAllInsideMap/insideNav.dart';

import 'mapPage.dart';

class placeVerification extends StatefulWidget {
  
  String _selectedPlace;
  String _password;
  placeVerification(this._selectedPlace,this._password);
  
  @override
  State<placeVerification> createState() => _placeVerificationState();
}

class _placeVerificationState extends State<placeVerification> {

  TextEditingController _enterpass = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      appBar: _appBar(),
      body: Center(
        child: SizedBox(
          width: Get.width*0.95,
          height: 250,
          child: Card(
           // margin: EdgeInsets.symmetric(horizontal: 10,vertical: 200),
            elevation: 0.8,
            color: Colors.white,
            shadowColor: Colors.red,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
               // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("${widget._selectedPlace}",style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24),),
                  SizedBox(height: 5,),
                  Text("Please enter password below mention in Entry gate",style: TextStyle(color: Colors.black, fontSize: 16),),
                  SizedBox(height: 10,),
                  TextFormField(
                    textAlign: TextAlign.left,
                    enableSuggestions: true,
                    cursorColor: Colors.red,
                    controller: _enterpass,
                    autofocus: true,
                    //keyboardType: TextInputType.,
                    decoration: InputDecoration(
                        hintText: "Password",
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 16,
                            fontFamily: 'Nato sans'),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: () {
                      if(_enterpass.text == widget._password){
                       // Get.off(map("${widget._selectedPlace}"));
                        Get.off(insideMAp(widget._password));
                      }else if(_enterpass.text == ''){
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Center(
                                  child: Text("Error message"),
                                ),
                                content: Text("Please enter passcode"),
                              );
                            });
                      }else{
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Center(
                                  child: Text("Error message"),
                                ),
                                content: Text("Please enter valid passcode"),
                              );
                            });
                      }
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.red)),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                    child: const Text('Verify',
                        style: TextStyle(color: Colors.white, fontSize: 24)),
                  )
                ],
              )
            ),
          ),
        ),
      ),
    ));
  }
}



AppBar _appBar() {
  return AppBar(
    title: const Text("Please Verify"),
    elevation: 0,
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
    titleSpacing: 20,
  );
}
