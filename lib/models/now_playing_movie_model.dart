class NowPlayingMovieModel {
  final int id;
  final String title, backdropPath;

  NowPlayingMovieModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        backdropPath = json['backdrop_path'],
        id = json['id'];
}
