class Movie {
  final title, plot, runtime, year, poster, actors, kind, ratings, releaseDate;

  Movie(
      {this.title,
      this.plot,
      this.runtime,
      this.year,
      this.poster,
      this.actors,
      this.kind,
      this.ratings,
      this.releaseDate});

  fromJson(data) {
    return Movie(
      title: data['title'],
      plot: data['plot'],
      runtime: data['runtime'],
      year: data['year'],
      poster: data['poster'],
      actors: data['actors'],
      kind: data['kind'],
      ratings: data['ratings'],
      releaseDate: data['releaseDate'],
    );
  }
}
