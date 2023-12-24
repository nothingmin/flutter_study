import 'package:flutter/material.dart';
import 'package:webflix/screens/movie_detail_screen.dart';
import 'package:webflix/services/api_services.dart';

import '../models/movie_metadata_model.dart';

class RectangleMovieImageWidget extends StatelessWidget {
  final MovieMetadataModel movie;

  const RectangleMovieImageWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => MovieDetailScreen(
                movie: movie,
              ),
            ));
      },
      child: Container(
        width: 320,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image.network(
          "${ApiService.imageBaseUrl}/${movie.backdropPath}",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
