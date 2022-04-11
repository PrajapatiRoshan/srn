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
        backgroundColor: Colors.black,
        appBar: _appBar(),
        body: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                _inputFormate(_authServices.email, 'Enter Your e-mail'),
                const SizedBox(
                  height: 20,
                ),
                _inputFormate(_authServices.password, 'Enter Password'),
                const SizedBox(
                  height: 20,
                ),
                _signButton(context),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.to(SignUpScreen());
                  },
                  child: const Text(
                    'SignUp',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
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
          fillColor: Colors.white,
          filled: true,
          hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontSize: 16,
              fontFamily: 'Nato sans'),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20)),
          enabledBorder: const OutlineInputBorder(
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
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: const BorderSide(color: Colors.red)),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
      child: const Text('SigIn',
          style: TextStyle(color: Colors.white, fontSize: 24)),
    );
  }
}

AppBar _appBar() {
  return AppBar(
    title: const Text(
      "Sign",
    ),
    elevation: 0,
    backgroundColor: Colors.black,
    titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
    titleSpacing: 20,
  );
}
