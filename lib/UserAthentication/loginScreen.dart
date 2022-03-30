import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:srn/UserAthentication/helperFirebaseService.dart';
import 'package:srn/UserAthentication/signUpScreen.dart';

class loginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _loginPage();
}

class _loginPage extends State<loginScreen> {
  AuthServices _authServices = AuthServices();

  // TextEditingController _phonenumber = TextEditingController();
  // TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(),
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Center(
            child: Column(
              children: [
                _inputFormate(_authServices.email, 'Enter Your e-mail'),
                SizedBox(
                  height: 20,
                ),
                _inputFormate(_authServices.password, 'Enter Password'),
                SizedBox(
                  height: 20,
                ),
                _signButton(context),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.to(SignUpScreen());
                  },
                  child: Text('SignUp'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputFormate(_controllername, text) {
    return TextFormField(
      textAlign: TextAlign.left,
      enableSuggestions: true,
      cursorColor: Colors.red,
      controller: _controllername,
      //autofocus: true,
      //keyboardType: TextInputType.,
      decoration: InputDecoration(
          hintText: "$text",
          hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.3),
              fontSize: 20,
              fontFamily: 'Nato sans'),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent))),
    );
  }

  Widget _signButton(context) {
    return ElevatedButton(
      onPressed: () {
        if (_authServices.email != "" && _authServices.password != "") {
          _authServices.loginUser(context);
        }
      },
      style: ElevatedButton.styleFrom(),
      child: Text('SigIn'),
    );
  }
}

AppBar _appBar() {
  return AppBar(
    title: Text(
      "Sign",
      style: TextStyle(color: Colors.black),
    ),
    backgroundColor: Colors.amberAccent,
  );
}
