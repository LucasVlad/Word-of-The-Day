import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wotd/api/wordoftheday_model.dart';
import 'package:wotd/api/api_service.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

/*class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<UserModel>? _userModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _userModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_userModel![index].id.toString()),
                          Text(_userModel![index].username),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_userModel![index].email),
                          Text(_userModel![index].website),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
      backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
    );
  }
}*/

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<WordOfTheDay>? _wordOfTheDay = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _wordOfTheDay = (await WordNikAPIService().getWotd())!; // it's broken
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12),
          child: GestureDetector(
            onTap: () {
              log('open streak menu');
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(60, 60, 60, 0.9),
                  width: 1,
                ),
                color: const Color.fromRGBO(60, 60, 60, 0.9),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                " 🔥0",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        title: GradientText(
          'WOTD',
          style: const TextStyle(
            fontSize: 34.0,
            fontWeight: FontWeight.bold,
          ),
          colors: const [
            Color.fromRGBO(0, 255, 56, 1),
            Color.fromRGBO(0, 240, 255, 1)
          ],
        ),
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
      body: Column(
        children: [
          const Divider(
            height: 2,
            color: Color.fromRGBO(46, 46, 46, 1),
            thickness: 1,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 120.0),
            child: Text(
              "defenestration",
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 70, right: 70, top: 60.0),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      style: TextStyle(
                          fontSize: 16.0,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Inter'),
                      children: <TextSpan>[
                        TextSpan(
                            text: "noun.   ",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromRGBO(64, 244, 255, 1))),
                        TextSpan(
                            text:
                                "the action of throwing someone out of a window.")
                      ]))),
          const Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 60.0),
            child: Divider(
              color: Color.fromRGBO(255, 255, 255, 1),
              thickness: 1,
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(left: 100, right: 100, top: 60.0),
              child: Text(
                "I'd have to watch for defenestration of myself during the deadly duel",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              )),
          _wordOfTheDay == null || _wordOfTheDay!.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: _wordOfTheDay!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(_wordOfTheDay![index].word),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(_wordOfTheDay![index].word),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
    );
  }
}
