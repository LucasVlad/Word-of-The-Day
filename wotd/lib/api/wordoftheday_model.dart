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
  String partOfSpeech;
  String definition;
  String exampleSentence;

  WordOfTheDay({
    required this.word,
    required this.partOfSpeech,
    required this.definition,
    required this.exampleSentence,
  });

  factory WordOfTheDay.fromJson(Map<String, dynamic> json) => WordOfTheDay(
        word: json["word"],
        partOfSpeech: json["definitions[0].partOfSpeech"],
        definition: json["definitions[0].text"],
        exampleSentence: json["examples[0].text"],
      );

  Map<String, dynamic> toJson() => {
        "word": word,
        "partOfSpeech": partOfSpeech,
        "definition": definition,
        "exampleSentence": exampleSentence,
      };
}
