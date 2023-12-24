class MovieMetadataModel {
  final int id;
  final String title, backdropPath;

  MovieMetadataModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        backdropPath = json['backdrop_path'],
        id = json['id'];
}
