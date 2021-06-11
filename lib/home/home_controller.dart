import 'package:get/get.dart';
import 'package:movies_and_shows/models/movie.dart';
import 'package:movies_and_shows/models/tv_show.dart';
import 'package:movies_and_shows/services/networking.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  var movieList = <Movie>[].obs;
  var showList = <TvShow>[].obs;

  @override
  void onInit() {
    fetchWhole();
    super.onInit();
  }

  void fetchWhole() async {
    isLoading(true);
    fetchMovies();
    fetchTvShows();
    isLoading(false);
    print("isLoading: $isLoading");
  }

  void fetchMovies() async {
    var movies = await NetworkHelper.fetchMovies();
    if (movies != null) {
      movieList.value = movies;
    }
  }

  void fetchTvShows() async {
    var tvShows = await NetworkHelper.fetchShows();
    if (tvShows != null) {
      showList.value = tvShows;
    }
  }
}
