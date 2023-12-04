/*
  model for wordnik API's word of the day get request
*/

import 'dart:convert';

List<WordOfTheDay> wordOfTheDayFromJson(String str) => List<WordOfTheDay>.from(
    json.decode(str).map((x) => WordOfTheDay.fromJson(x)));

String wordOfTheDayToJson(List<WordOfTheDay> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WordOfTheDay {
  String word;

  WordOfTheDay({
    required this.word,
  });

  factory WordOfTheDay.fromJson(Map<String, dynamic> json) => WordOfTheDay(
        word: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "word": word,
      };
}
