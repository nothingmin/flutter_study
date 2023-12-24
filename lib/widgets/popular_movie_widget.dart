import 'package:flutter/cupertino.dart';
import 'package:webflix/models/popular_movie_model.dart';
import 'package:webflix/services/api_services.dart';

class PopularMovieWidget extends StatelessWidget {
  final PopularMovieModel movie;

  const PopularMovieWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.network(
        "${ApiService.imageBaseUrl}/${movie.backdropPath}",
        fit: BoxFit.fill,
      ),
    );
  }
}
