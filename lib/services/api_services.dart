import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webflix/models/webtoon_episode_model.dart';
import 'package:webflix/models/webtoon_model.dart';

import '../models/webtoon_detail_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var w in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(w));
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getWebtoon(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return WebtoonDetailModel.fromJson(jsonDecode(response.body));
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> webtoonInstances = [];

    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      return webtoons
          .map((webtoon) => WebtoonEpisodeModel.fromJson(webtoon))
          .toList();
    }
    throw Error();
  }
}
