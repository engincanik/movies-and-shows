import 'package:get/get.dart';
import 'package:movies_and_shows/models/movie_video.dart';
import 'package:movies_and_shows/models/tv_show_detail.dart';
import 'package:movies_and_shows/models/tv_show_video.dart';
import 'package:movies_and_shows/services/networking.dart';

class DetailController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isMovieLoading = true.obs;
  RxBool isTvShowLoading = true.obs;
  var tvShowDetail = TvShowDetail().obs;
  var movieVideoObs = MovieVideo().obs;
  var tvShowVideoObs = TvShowVideo().obs;

  void fetchTvShowById(int showId) async {
    isLoading(true);
    try {
      var tvShow = await NetworkHelper.fecthTvShowById(showId);
      if (tvShow != null) {
        tvShowDetail.value = tvShow;
      }
    } catch (e) {
      print("DetailController: $e");
    } finally {
      isLoading(false);
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

  void fetchTvShowVideo(int showId) async {
    isTvShowLoading(true);
    try {
      var tvShowVideo = await NetworkHelper.fetchTvShowVideo(showId);
      if (tvShowVideo != null) {
        tvShowVideoObs.value = tvShowVideo;
      }
    } catch (e) {
      print("DetailController: $e");
    } finally {
      isTvShowLoading(false);
    }
  }
}
