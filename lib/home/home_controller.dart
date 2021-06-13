import 'package:get/get.dart';
import 'package:movies_and_shows/models/movie.dart';
import 'package:movies_and_shows/models/movie_video.dart';
import 'package:movies_and_shows/models/tv_show.dart';
import 'package:movies_and_shows/services/networking.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isLoadingMovies = true.obs;
  RxBool isLoadingTvShows = true.obs;
  var movieList = <Movie>[].obs;
  var showList = <TvShow>[].obs;
  RxBool isMovieLoading = true.obs;
  var movieVideoObs = MovieVideo().obs;

  void fetchMovies() async {
    isLoadingMovies(true);
    try {
      var movies = await NetworkHelper.fetchMovies();
      if (movies != null) {
        movieList.value = movies;
      }
    } catch (e) {
      print("Fetching movies error: $e");
    } finally {
      isLoadingMovies(false);
    }
  }

  void fetchTvShows() async {
    isLoadingTvShows(true);
    try {
      var tvShows = await NetworkHelper.fetchShows();
      if (tvShows != null) {
        showList.value = tvShows;
      }
    } catch (e) {
      print("Fetching tv shows error: $e");
    } finally {
      isLoadingTvShows(false);
    }
  }

  void fetchMovieVideo(int movieId) async {
    isMovieLoading(true);
    try {
      var movieVideo = await NetworkHelper.fetchMovieVideo(movieId);
      if (movieVideo != null) {
        movieVideoObs.value = movieVideo;
      }
    } catch (e) {
      print("DetailController: $e");
    } finally {
      isMovieLoading(false);
    }
  }
}
