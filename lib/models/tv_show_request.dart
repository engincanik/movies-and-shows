import 'dart:convert';

import 'package:movies_and_shows/models/tv_show.dart';

TvShowRequest tvShowRequestFromJson(String str) =>
    TvShowRequest.fromJson(json.decode(str));

String tvShowRequestToJson(TvShowRequest data) => json.encode(data.toJson());

class TvShowRequest {
  TvShowRequest({
    this.page,
    this.tvShows,
    this.totalPages,
    this.totalResults,
  });

  int page;
  List<TvShow> tvShows;
  int totalPages;
  int totalResults;

  factory TvShowRequest.fromJson(Map<String, dynamic> json) => TvShowRequest(
        page: json["page"],
        tvShows:
            List<TvShow>.from(json["tv_shows"].map((x) => TvShow.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "tv_shows": List<dynamic>.from(tvShows.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
