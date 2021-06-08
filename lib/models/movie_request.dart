import 'dart:convert';

import 'package:movies_and_shows/models/model.dart';

MovieRequest movieRequestFromJson(String str) =>
    MovieRequest.fromJson(json.decode(str));

String movieRequestToJson(MovieRequest data) => json.encode(data.toJson());

class MovieRequest {
  MovieRequest({
    this.page,
    this.movies,
    this.totalPages,
    this.totalResults,
  });

  int page;
  List<Movie> movies;
  int totalPages;
  int totalResults;

  factory MovieRequest.fromJson(Map<String, dynamic> json) => MovieRequest(
        page: json["page"],
        movies: List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "movies": List<dynamic>.from(movies.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
