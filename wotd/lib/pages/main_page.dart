import 'package:flutter/material.dart';
import 'package:wotd/pages/home.dart';
import 'package:wotd/pages/testpage.dart';

class _Stuff {
  static int index = 0;

  static const pages = [
    Home(),
    TestPage(),
  ];
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Stuff.pages[_Stuff.index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _Stuff.index,
          onTap: (int index) => setState(() => index = _Stuff.index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.church), label: 'Test'),
          ]),
    );
  }
}
