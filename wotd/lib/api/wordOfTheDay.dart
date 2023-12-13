/*
  model for wordnik API's word of the day get request
*/

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:wotd/api/apiConstants.dart';

// Word of the day class
class WordOfTheDay {
  late String word;
  List<Definitions>? definitions;
  List<Examples>? examples;

  WordOfTheDay({
    required this.word,
    required this.definitions,
    required this.examples,
  });

  WordOfTheDay.fromJson(Map<String, dynamic> json) {
    word = json['word'];
    definitions = <Definitions>[];

    if (json['definitions'] != null) {
      definitions = <Definitions>[];
      json['definitions'].forEach((v) {
        definitions!.add(Definitions.fromJson(v));
      });
    }
    if (json['examples'] != null) {
      examples = <Examples>[];
      json['examples'].forEach((v) {
        examples!.add(Examples.fromJson(v));
      });
    }
  }
}

// Word of the day definitions class
class Definitions {
  String definition;
  String partOfSpeech;

  Definitions({
    required this.definition,
    required this.partOfSpeech,
  });

  factory Definitions.fromJson(Map<String, dynamic> json) {
    return Definitions(
      definition: json["text"],
      partOfSpeech: json["partOfSpeech"],
    );
  }
}

// Word of the day examples class
class Examples {
  String example;

  Examples({
    required this.example,
  });

  factory Examples.fromJson(Map<String, dynamic> json) {
    return Examples(
      example: json['text'],
    );
  }
}

// API Call Class & Funcation
class WordOfTheDayService {
  Future<WordOfTheDay?> getWotd() async {
    try {
      var url = Uri.parse(WordnikConstants.wordnikBaseURL +
          WordnikConstants.wotdEndpoint +
          WordnikConstants.wordnikApiKeyEndpoint);

      var response = await get(url);

      if (response.statusCode == 200) {
        WordOfTheDay model = WordOfTheDay.fromJson(jsonDecode(response.body));
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
