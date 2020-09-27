import 'package:flutter/material.dart';
import 'package:PakNaga/screens/App_Home.dart';
import 'dart:async';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPage createState() => _SplashScreenPage();
}

class _SplashScreenPage extends State<SplashScreenPage> {

  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return AppHome();
        })
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "assets/logo1.png",
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}