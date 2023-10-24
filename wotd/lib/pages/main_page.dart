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
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (int index) => setState(() => this.index = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          ]),
    );
  }
}
