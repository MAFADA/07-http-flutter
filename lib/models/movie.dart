class Movie {
  int? id;
  String? title;
  double? voteAverage;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? originalLanguage;

  Movie(this.id, this.title, this.voteAverage, this.overview, this.posterPath,
      this.releaseDate, this.originalLanguage);

  Movie.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    title = parsedJson['title'];
    voteAverage = parsedJson['vote_average'] * 1.0;
    overview = parsedJson['overview'];
    posterPath = parsedJson['poster_path'];
    releaseDate = parsedJson['release_date'];
    originalLanguage = parsedJson['original_language'];
  }
}
