import 'package:flutter/material.dart';
import 'package:wotd/pages/main_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      theme: ThemeData(
        fontFamily: 'Inter',
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Inter'),
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}
