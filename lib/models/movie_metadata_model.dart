class MovieMetadataModel {
  final int id;
  final String title, backdropPath, poster_path;

  MovieMetadataModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        backdropPath = json['backdrop_path'],
        id = json['id'],
        poster_path = json['poster_path'];
}
