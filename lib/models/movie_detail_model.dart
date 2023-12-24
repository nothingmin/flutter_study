class MovieDetailModel {
  final int id;
  final int runtime;
  final String title, overview;
  final List<String> genres;
  final double voteAverage;

  MovieDetailModel({
    required this.id,
    required this.runtime,
    required this.title,
    required this.overview,
    required this.genres,
    required this.voteAverage,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    var genres = json['genres'] as List;
    MovieDetailModel a = MovieDetailModel(
      id: json['id'],
      runtime: json['runtime'],
      title: json['title'],
      overview: json['overview'],
      genres: genres
          .map((i) => Genre.fromJson(i))
          .map((genre) => genre.name)
          .toList(),
      voteAverage: json['vote_average'],
    );
    return a;
  }
}

class Genre {
  int id;
  String name;

  Genre.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}
