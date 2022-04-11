import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:srn/Screens/compass.dart';
import 'package:srn/UserAthentication/loginScreen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
          splash: Image.asset('assets/mainLogo.png'),
          splashTransition: SplashTransition.fadeTransition,
          nextScreen: loginScreen()
    ),
      debugShowCheckedModeBanner: false,
    );
  }
}
