import 'package:http/http.dart' as http;
import 'package:movies_and_shows/models/movie.dart';
import 'package:movies_and_shows/models/movie_request.dart';
import 'package:movies_and_shows/models/movie_video.dart';
import 'package:movies_and_shows/models/tv_show.dart';
import 'package:movies_and_shows/models/tv_show_detail.dart';
import 'package:movies_and_shows/models/tv_show_request.dart';
import 'package:movies_and_shows/models/tv_show_video.dart';
import 'package:movies_and_shows/utils/constants.dart';

class NetworkHelper {
  static var client = http.Client();
  static String movieRequestURL =
      "https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}&language=en-US&page=1";
  static String tvShowRequestURL =
      "https://api.themoviedb.org/3/tv/popular?api_key=${Constants.apiKey}&language=en-US&page=1";
  static Future<List<Movie>> fetchMovies() async {
    var response = await client.get(Uri.parse(movieRequestURL));
    switch (response.statusCode) {
      case 200:
        var jsonString = response.body;
        return movieRequestFromJson(jsonString).movies;
        break;
      case 400:
        print("Http 400 - Bad Request");
        return null;
        break;
      case 401:
        print("Http 401 - Unauthorized");
        return null;
        break;
      default:
        return null;
    }
  }

  static Future<List<TvShow>> fetchShows() async {
    var response = await client.get(Uri.parse(tvShowRequestURL));
    switch (response.statusCode) {
      case 200:
        var jsonString = response.body;
        return tvShowRequestFromJson(jsonString).tvShows;
        break;
      case 401:
        print("Http 401 - Unauthorized");
        return null;
        break;
      case 404:
        print("Http 404 - Not Found");
        return null;
        break;
      default:
        return null;
    }
  }

  static Future<TvShowDetail> fecthTvShowById(int showId) async {
    String tvShowDetailURL =
        "https://api.themoviedb.org/3/tv/$showId?api_key=${Constants.apiKey}&language=en-US";
    var response = await client.get(Uri.parse(tvShowDetailURL));
    switch (response.statusCode) {
      case 200:
        var jsonString = response.body;
        return tvShowDetailFromJson(jsonString);
        break;
      case 401:
        print("Http 401 - Unauthorized");
        return null;
        break;
      case 404:
        print("Http 404 - Not Found");
        return null;
        break;
      default:
        return null;
    }
  }

  static Future<TvShowVideo> fetchTvShowVideo(int showId) async {
    String tvShowVideoURL =
        "https://api.themoviedb.org/3/tv/$showId/videos?api_key=${Constants.apiKey}&language=en-US";
    var response = await client.get(Uri.parse(tvShowVideoURL));
    switch (response.statusCode) {
      case 200:
        var jsonString = response.body;
        return tvShowVideoFromJson(jsonString);
        break;
      case 401:
        print("Http 401 - Unauthorized");
        return null;
        break;
      case 404:
        print("Http 404 - Not Found");
        return null;
        break;
      default:
        return null;
    }
  }

  static Future<MovieVideo> fetchMovieVideo(int movieId) async {
    String movieVideoURL =
        "https://api.themoviedb.org/3/movie/$movieId/videos?api_key=${Constants.apiKey}&language=en-US";
    var response = await client.get(Uri.parse(movieVideoURL));
    switch (response.statusCode) {
      case 200:
        var jsonString = response.body;
        return movieVideoFromJson(jsonString);
        break;
      case 401:
        print("Http 401 - Unauthorized");
        return null;
        break;
      case 404:
        print("Http 404 - Not Found");
        return null;
        break;
      default:
        return null;
    }
  }
}
