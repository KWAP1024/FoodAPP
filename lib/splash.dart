// ignore_for_file: prefer_const_constructors, avoid_print, prefer_typing_uninitialized_variables

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:resturant/Navigation/homepage.dart';

var finalphone;

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSplashScreen(
          duration: 3000,
          splash: AssetImage('splash.png'),
          nextScreen: Homepage(),
          splashTransition: SplashTransition.scaleTransition,
          backgroundColor: Colors.blue
        )
        ],
      )),
    );
  }
}
