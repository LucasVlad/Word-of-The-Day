import 'package:flutter/material.dart';
import 'package:wotd/pages/home.dart';
import 'package:wotd/pages/search.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int index = 0;

  static const pages = [
    Home(),
    Search(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (int index) => setState(() => this.index = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
          ],
          backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
          selectedItemColor: const Color.fromRGBO(210, 210, 210, 1),
          unselectedItemColor: const Color.fromRGBO(170, 170, 170, 1),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          elevation: 0.0,
        ),
      ),
    );
  }
}
