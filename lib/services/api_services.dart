import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webflix/models/movie_metadata_model.dart';

class ApiService {
  static const String imageBaseUrl = "https://image.tmdb.org/t/p/w500";
  static const String movieBaseUrl =
      "https://movies-api.nomadcoders.workers.dev";
  static const String popular = "popular";
  static const String nowPlaying = "now-playing";
  static const String comingSoon = "coming-soon";

  static Future<List<MovieMetadataModel>> getPopularMovies() async {
    final url = Uri.parse('$movieBaseUrl/$popular');
    final response = await http.get(url);
    List<MovieMetadataModel> popularMovies = [];
    if (response.statusCode == 200) {
      final dynamic jsonBody = jsonDecode(response.body);
      final List<dynamic> movies = jsonBody["results"];
      for (var m in movies) {
        popularMovies.add(MovieMetadataModel.fromJson(m));
      }
      return popularMovies;
    }
    throw Error();
  }

  static Future<List<MovieMetadataModel>> getNowPlayingMovies() async {
    final url = Uri.parse('$movieBaseUrl/$nowPlaying');
    final response = await http.get(url);
    List<MovieMetadataModel> nowPlayingMovies = [];
    if (response.statusCode == 200) {
      final dynamic jsonBody = jsonDecode(response.body);
      final List<dynamic> movies = jsonBody["results"];
      for (var m in movies) {
        nowPlayingMovies.add(MovieMetadataModel.fromJson(m));
      }
      return nowPlayingMovies;
    }
    throw Error();
  }

  static Future<List<MovieMetadataModel>> getComingSoonMovies() async {
    final url = Uri.parse('$movieBaseUrl/$comingSoon');
    final response = await http.get(url);
    List<MovieMetadataModel> comingSoonMovies = [];
    if (response.statusCode == 200) {
      final dynamic jsonBody = jsonDecode(response.body);
      final List<dynamic> movies = jsonBody["results"];
      for (var m in movies) {
        comingSoonMovies.add(MovieMetadataModel.fromJson(m));
      }
      return comingSoonMovies;
    }
    throw Error();
  }
}
