import 'dart:convert';

import 'package:movies_and_shows/models/video_result.dart';

MovieVideo movieVideoFromJson(String str) =>
    MovieVideo.fromJson(json.decode(str));

String movieVideoToJson(MovieVideo data) => json.encode(data.toJson());

class MovieVideo {
  MovieVideo({
    this.id,
    this.results,
  });

  int id;
  List<VideoResult> results;

  factory MovieVideo.fromJson(Map<String, dynamic> json) => MovieVideo(
        id: json["id"],
        results: List<VideoResult>.from(
            json["results"].map((x) => VideoResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
