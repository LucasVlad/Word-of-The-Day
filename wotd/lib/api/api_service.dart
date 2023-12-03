import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:wotd/api/apis.dart';
import 'package:wotd/api/wordoftheday_model.dart';

class WordNikAPIService {
  Future<List<WordOfTheDay>?> getWotd() async {
    try {
      var url = Uri.parse(ApiConstants.wordnikBaseURL +
          ApiConstants.wotdEndpoint +
          ApiConstants.wordnikApiKeyEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<WordOfTheDay> model = wordOfTheDayFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
