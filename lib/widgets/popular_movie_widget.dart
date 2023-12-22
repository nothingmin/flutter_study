import 'package:flutter/cupertino.dart';
import 'package:webflix/models/popular_movie_model.dart';
import 'package:webflix/services/api_services.dart';

class PopularMovie extends StatelessWidget {
  final PopularMovieModel movie;

  const PopularMovie({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.network(
        "${ApiService.imageBaseUrl}/${movie.backdropPath}",
      ),
    );
  }
}
