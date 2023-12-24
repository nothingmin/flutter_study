import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webflix/models/coming_soon_movie_model.dart';
import 'package:webflix/models/now_playing_movie_model.dart';
import 'package:webflix/models/popular_movie_model.dart';

class ApiService {
  static const String imageBaseUrl = "https://image.tmdb.org/t/p/w500";
  static const String movieBaseUrl =
      "https://movies-api.nomadcoders.workers.dev";
  static const String popular = "popular";
  static const String nowPlaying = "now-playing";
  static const String comingSoon = "coming-soon";

  static Future<List<PopularMovieModel>> getPopularMovies() async {
    final url = Uri.parse('$movieBaseUrl/$popular');
    final response = await http.get(url);
    List<PopularMovieModel> popularMovies = [];
    if (response.statusCode == 200) {
      final dynamic jsonBody = jsonDecode(response.body);
      final List<dynamic> movies = jsonBody["results"];
      for (var m in movies) {
        popularMovies.add(PopularMovieModel.fromJson(m));
      }
      return popularMovies;
    }
    throw Error();
  }

  static Future<List<NowPlayingMovieModel>> getNowPlayingMovies() async {
    final url = Uri.parse('$movieBaseUrl/$nowPlaying');
    final response = await http.get(url);
    List<NowPlayingMovieModel> nowPlayingMovies = [];
    if (response.statusCode == 200) {
      final dynamic jsonBody = jsonDecode(response.body);
      final List<dynamic> movies = jsonBody["results"];
      for (var m in movies) {
        nowPlayingMovies.add(NowPlayingMovieModel.fromJson(m));
      }
      return nowPlayingMovies;
    }
    throw Error();
  }

  static Future<List<ComingSoonMovieModel>> getComingSoonMovies() async {
    final url = Uri.parse('$movieBaseUrl/$comingSoon');
    final response = await http.get(url);
    List<ComingSoonMovieModel> comingSoonMovies = [];
    if (response.statusCode == 200) {
      final dynamic jsonBody = jsonDecode(response.body);
      final List<dynamic> movies = jsonBody["results"];
      for (var m in movies) {
        comingSoonMovies.add(ComingSoonMovieModel.fromJson(m));
      }
      return comingSoonMovies;
    }
    throw Error();
  }
}
