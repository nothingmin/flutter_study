class PopularMovieModel {
  final int id;
  final String title, backdropPath;

  PopularMovieModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        backdropPath = json['backdrop_path'],
        id = json['id'];
}
