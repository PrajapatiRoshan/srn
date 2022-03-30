import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OTPscreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _OTP();

}

class _OTP extends State<OTPscreen>{

  TextEditingController _otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            children:[
              TextFormField(
                textAlign: TextAlign.left,
                enableSuggestions: true,
                cursorColor: Colors.red,
                controller: _otp,
                //autofocus: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter OTP",
                    hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.3),
                        fontSize: 20,
                        fontFamily: 'Nato sans'),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent))),
              )
            ]
          ),
        ),
      ),
    );
  }

}