import 'package:flutter/material.dart';
import 'package:webflix/models/popular_movie_model.dart';
import 'package:webflix/services/api_services.dart';

import '../widgets/popular_movie_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<PopularMovieModel>> popularMovies = ApiService.getPopularMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Popular Movies",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: popularMovies,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return makePopularMovieList(snapshot);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

SizedBox makePopularMovieList(AsyncSnapshot<List<PopularMovieModel>> snapshot) {
  return SizedBox(
    height: 160,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return PopularMovie(movie: movie);
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
    ),
  );
}
