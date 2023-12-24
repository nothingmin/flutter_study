import 'package:flutter/material.dart';
import 'package:webflix/models/movie_detail_model.dart';
import 'package:webflix/services/api_services.dart';

import '../models/movie_metadata_model.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieMetadataModel movie;

  MovieDetailScreen({
    super.key,
    required this.movie,
  });

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late Future<MovieDetailModel> detail;

  @override
  void initState() {
    super.initState();
    detail = ApiService.getMovieById(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Back to list",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "${ApiService.imageBaseUrl}/${widget.movie.poster_path}",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: Container(),
            ),
            Flexible(
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FutureBuilder(
                      future: detail,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.title,
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  children: [
                                    for (int i = 0;
                                        i < snapshot.data!.voteAverage / 2;
                                        i++)
                                      const Icon(
                                        Icons.star,
                                        color: Color(0xfff8d849),
                                      ),
                                    for (int i =
                                            (snapshot.data!.voteAverage / 2)
                                                .ceil();
                                        i < 5;
                                        i++)
                                      const Icon(
                                        Icons.star,
                                        color: Colors.grey,
                                      ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${Duration(minutes: snapshot.data!.runtime).toString().split(":")[0]}h ${Duration(minutes: snapshot.data!.runtime).toString().split(":")[1]}min | ${snapshot.data!.genres.join(" ")}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Storyline",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                                const Text(
                                  "When an alien race and factions within Starfleet attempt to take over a planet that has \"regenerative\" properties, it falls upon Captain Picard and the crew of the Enterprise to defend the planet's people as well as the very ideals upon which the Federation itself was founded.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 50,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xfff8d849),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 95,
                          ),
                          child: Text(
                            "Buy ticket",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
