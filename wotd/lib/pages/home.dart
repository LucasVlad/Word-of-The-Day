import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wotd/api/wordOfTheDay.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

WordOfTheDay? _wordOfTheDay;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    if (_wordOfTheDay == null) {
      _wordOfTheDay = (await WordOfTheDayService().getWotd());
      Future.delayed(const Duration(seconds: 1))
          .then((value) => setState(() {}));
    }
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

        //add back when you actually add the cards and
        //need to be able to switch between the list views
        // actions: <Widget>[
        //   Padding(
        //       padding: const EdgeInsets.only(right: 20.0),
        //       child: GestureDetector(
        //         onTap: () {},
        //         child: const Icon(
        //           Icons.search,
        //           size: 26.0,
        //         ),
        //       )),
        // ],
        backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
        elevation: 0,
      ),
      body: _wordOfTheDay == null
          ? const Column(
              children: [
                Divider(
                  height: 2,
                  color: Color.fromRGBO(46, 46, 46, 1),
                  thickness: 1,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 300.0),
                  child: CircularProgressIndicator(),
                )
              ],
            )
          : Column(
              children: [
                const Divider(
                  height: 2,
                  color: Color.fromRGBO(46, 46, 46, 1),
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 120.0),
                  child: Text(
                    _wordOfTheDay!.word,
                    style: const TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 70, right: 70, top: 60.0),
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: const TextStyle(
                                fontSize: 16.0,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Inter'),
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                      "${_wordOfTheDay!.definitions![0].partOfSpeech}.   ",
                                  style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Color.fromRGBO(64, 244, 255, 1))),
                              TextSpan(
                                  text:
                                      _wordOfTheDay!.definitions![0].definition)
                            ]))),
                const Padding(
                  padding: EdgeInsets.only(left: 40, right: 40, top: 60.0),
                  child: Divider(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    thickness: 1,
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 70, right: 70, top: 60.0),
                    child: Text(
                      _wordOfTheDay!.examples![0].example,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
      backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
    );
  }
}
