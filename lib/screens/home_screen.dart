import 'package:flutter/material.dart';
import 'package:webflix/models/movie_metadata_model.dart';
import 'package:webflix/services/api_services.dart';

import '../widgets/movie_backdrop_and_title_list_widget.dart';
import '../widgets/movie_backdrop_list_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<MovieMetadataModel>> popularMovies =
      ApiService.getPopularMovies();
  Future<List<MovieMetadataModel>> nowPlayingMovies =
      ApiService.getNowPlayingMovies();
  Future<List<MovieMetadataModel>> comingSoonMovies =
      ApiService.getComingSoonMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
              MovieBackdropListWidget(movies: popularMovies),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Now in Cinemas",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MovieBackdropAndTitleListWidget(movies: nowPlayingMovies),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Coming Soon",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MovieBackdropAndTitleListWidget(movies: comingSoonMovies),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
