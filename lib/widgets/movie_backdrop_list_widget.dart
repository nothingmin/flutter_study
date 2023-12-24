import 'package:flutter/material.dart';

import '../models/movie_metadata_model.dart';
import 'movie_backdrop_widget.dart';

class MovieBackdropListWidget extends StatelessWidget {
  const MovieBackdropListWidget({
    super.key,
    required this.movies,
  });

  final Future<List<MovieMetadataModel>> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: FutureBuilder(
        future: movies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var movie = snapshot.data![index];
                return RectangleMovieImageWidget(movie: movie);
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
            );
            ;
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
