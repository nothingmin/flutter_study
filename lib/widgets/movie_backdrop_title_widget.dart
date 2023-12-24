import 'package:flutter/material.dart';
import 'package:webflix/screens/movie_detail_screen.dart';
import 'package:webflix/services/api_services.dart';

import '../models/movie_metadata_model.dart';

class MovieBackdropAndTitleWidget extends StatelessWidget {
  final MovieMetadataModel movie;

  const MovieBackdropAndTitleWidget({
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
      child: Column(
        children: [
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.network(
              "${ApiService.imageBaseUrl}/${movie.backdropPath}",
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 160,
            child: Text(
              movie.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
