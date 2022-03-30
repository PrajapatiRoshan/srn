import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:srn/UserAthentication/helperFirebaseService.dart';
import 'package:srn/homePage.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _signUp();
}

class _signUp extends State<SignUpScreen> {
  AuthServices _authservice = AuthServices();

  TextEditingController _password = TextEditingController();
  TextEditingController _confpassword = TextEditingController();

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
                _inputFormate(_authservice.email, 'Enter Your phone number'),
                SizedBox(
                  height: 20,
                ),
                _inputFormate(_password, 'Create new Password'),
                SizedBox(
                  height: 20,
                ),
                _inputFormate(_confpassword, 'Create Password again'),
                _signUpButton(context),
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
      //keyboardType: TextInputType.number,
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

  Widget _signUpButton(context) {
    return ElevatedButton(
      onPressed: () {
        if (_password.text != _confpassword.text) {
          _checkvalidity(context);
        } else {
          _authservice.password = _confpassword;
          if (_authservice.email != "" && _authservice.password != '') {
            _authservice.RegisterUser(context);
            //Get.to(HomeScreen());
          }
        }
      },
      style: ElevatedButton.styleFrom(),
      child: Text('Create account'),
    );
  }

  void _checkvalidity(context) {
    setState(() {
      _password.clear();
      _confpassword.clear();
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Please enter both password as same"),
            );
          });
    });
  }
}

AppBar _appBar() {
  return AppBar(
    title: Text("Create account"),
    backgroundColor: Colors.amberAccent,
  );
}
