import 'package:flutter/material.dart';

import '../models/movie_metadata_model.dart';
import 'movie_backdrop_title_widget.dart';

class MovieBackdropAndTitleListWidget extends StatelessWidget {
  const MovieBackdropAndTitleListWidget({
    super.key,
    required this.movies,
  });

  final Future<List<MovieMetadataModel>> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: FutureBuilder(
        future: movies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var movie = snapshot.data![index];
                return MovieBackdropAndTitleWidget(movie: movie);
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
