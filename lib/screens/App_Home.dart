import 'package:flutter/material.dart';
import 'package:PakNaga/screens/HomePage-copy.dart';
import 'package:PakNaga/screens/ArticlePage.dart';
import 'package:PakNaga/screens/FaqPage.dart';
import 'package:PakNaga/screens/AboutPage.dart';
import 'package:flutter_icons/flutter_icons.dart';


class AppHome extends StatefulWidget {
  @override
  _AppHome createState() => _AppHome();
}

class _AppHome extends State<AppHome> {

  // current index of bottom navigation
  int currentIndex = 0;

  List<Widget> _widgetOptions = <Widget> [
    HomePage(),
    ArticlePage(),
    FaqPage(),
    AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetOptions[currentIndex],
      bottomNavigationBar: bottomNavbar(),
    );
  }

  Widget bottomNavbar() {
    final List<BottomNavigationBarItem> items = [
      // item 1
      BottomNavigationBarItem(
        icon: Icon(
          currentIndex == 0 
          ? Feather.home 
          : Feather.home,
        ),
        title: Text(''),
      ),

      // item 2
      BottomNavigationBarItem(
        icon: Icon(
          currentIndex == 1 
          ? Feather.file_text
          : Feather.file_text,
        ),
        title: Text(''),
      ),

      // item 3
      BottomNavigationBarItem(
        icon: Icon(
          currentIndex == 2 
          ? Feather.help_circle
          : Feather.help_circle,
        ),
        title: Text(''),
      ),

      // item 4
      BottomNavigationBarItem(
        icon: Icon(
          currentIndex == 3 
          ? Feather.user
          : Feather.user,
        ),
        title: Text(''),
      ),
    ];

    return BottomNavigationBar(
      items: items,
      onTap: (int index) {
        setState(() {
          currentIndex = index;
        });
      },
      currentIndex: currentIndex,
      selectedItemColor: Colors.brown,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 0.0,
      type: BottomNavigationBarType.fixed,
      elevation: 18.0,
      backgroundColor: Colors.white,
      // margin: EdgeInsets.all(15),
    );
    
  }

}