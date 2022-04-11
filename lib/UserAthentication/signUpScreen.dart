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
        backgroundColor: Colors.black,
        body: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.all(20),
          child: Center(
            child: ListView(
              children: [
                _inputFormate(_authservice.email, 'Enter your e-mail'),
                const SizedBox(
                  height: 15,
                ),
                _inputFormate(_password, 'Create new Password'),
                const SizedBox(
                  height: 15,
                ),
                _inputFormate(_confpassword, 'Enter Password again'),
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
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: "$text",
          fillColor: Colors.white,
          filled: true,
          hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontSize: 16,
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
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.red)),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
      child: Text(
        'Create account',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
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
    elevation: 0,
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
    titleSpacing: 20,
  );
}
