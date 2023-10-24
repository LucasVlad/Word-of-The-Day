import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.menu,
          ),
        ),
        title: const Text('Today'),
        centerTitle: true,
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
        ],
        backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
        elevation: 0,
      ),
      body: const Column(
        children: [
          Divider(
            height: 2,
            color: Color.fromRGBO(46, 46, 46, 1),
            thickness: 1,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text("TestPage"),
          )
        ],
      ),
      backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
    );
  }
}
