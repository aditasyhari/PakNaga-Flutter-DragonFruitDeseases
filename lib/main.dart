import 'package:flutter/material.dart';
import 'package:PakNaga/splash_screens/splashscreen_view.dart';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      // onGenerateRoute: appRoutes.routes,
      home: SplashScreenPage(),
    );
  }
}