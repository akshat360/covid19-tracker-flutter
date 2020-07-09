import 'package:covid19tracker/Screens/news_screen.dart';
import 'package:covid19tracker/Screens/stats_screen.dart';
import 'package:covid19tracker/Screens/tips_screen.dart';
import 'package:covid19tracker/constants.dart';
import 'package:flutter/material.dart';
import 'Screens/home_screen.dart';
import 'Screens/stats_screen.dart';
import 'Screens/news_screen.dart';
import 'Screens/tips_screen.dart';

void main() {
  runApp(MyAppLess());
}

class MyAppLess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(child: MyApp()),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  static List<Widget> _screenOptions = <Widget>[
    HomeScreen(),
    StatsScreen(),
    NewsScreen(),
    TipsScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            title: Text('Stats'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            title: Text('News'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            title: Text('Health'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kPinkColor,
        onTap: _onItemTapped,
        unselectedItemColor: kDarkGrayColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}

//
//initialRoute: "/",
//routes: {
//"/": (context) => HomeScreen(),
//"stats_screen": (context) => StatsScreen(),
//"news_screen": (context) => NewsScreen(),
//"tips_screen": (context) => TipsScreen(),
//},
