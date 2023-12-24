import 'package:flutter/material.dart';
import 'package:webflix/models/coming_soon_movie_model.dart';
import 'package:webflix/models/now_playing_movie_model.dart';
import 'package:webflix/models/popular_movie_model.dart';
import 'package:webflix/services/api_services.dart';
import 'package:webflix/widgets/coming_soon_movie_widget.dart';
import 'package:webflix/widgets/now_playing_movie_widget.dart';
import 'package:webflix/widgets/popular_movie_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<PopularMovieModel>> popularMovies = ApiService.getPopularMovies();
  Future<List<NowPlayingMovieModel>> nowPlayingMovies =
      ApiService.getNowPlayingMovies();
  Future<List<ComingSoonMovieModel>> comingSoonMovies =
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
              SizedBox(
                height: 200,
                child: FutureBuilder(
                  future: popularMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var movie = snapshot.data![index];
                          return PopularMovieWidget(movie: movie);
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
              ),
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
              SizedBox(
                height: 240,
                child: FutureBuilder(
                  future: nowPlayingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var movie = snapshot.data![index];
                          return NowPlayingMovieWidget(movie: movie);
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
              ),
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
              SizedBox(
                height: 240,
                child: FutureBuilder(
                  future: comingSoonMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var movie = snapshot.data![index];
                          return ComingSoonMovieWidget(movie: movie);
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
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
