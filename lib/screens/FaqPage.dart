import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  @override
  _FaqPage createState() => _FaqPage();
}

class _FaqPage extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Faq')],
        ),
      ),
    );
  }
}