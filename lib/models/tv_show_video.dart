import 'dart:convert';

import 'package:movies_and_shows/models/video_result.dart';

TvShowVideo tvShowVideoFromJson(String str) =>
    TvShowVideo.fromJson(json.decode(str));

String tvShowVideoToJson(TvShowVideo data) => json.encode(data.toJson());

class TvShowVideo {
  TvShowVideo({
    this.id,
    this.results,
  });

  int id;
  List<VideoResult> results;

  factory TvShowVideo.fromJson(Map<String, dynamic> json) => TvShowVideo(
        id: json["id"],
        results: List<VideoResult>.from(
            json["results"].map((x) => VideoResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
