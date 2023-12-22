import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webflix/models/popular_movie_model.dart';

class ApiService {
  static const String imageBaseUrl = "https://image.tmdb.org/t/p/w500";
  static const String movieBaseUrl =
      "https://movies-api.nomadcoders.workers.dev";
  static const String popular = "popular";

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
}
