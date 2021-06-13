import 'package:get/get.dart';
import 'package:movies_and_shows/models/tv_show_detail.dart';
import 'package:movies_and_shows/services/networking.dart';

class DetailController extends GetxController {
  RxBool isLoading = true.obs;
  var tvShowDetail = TvShowDetail().obs;

  void fetchTvShowById(int showId) async {
    isLoading(true);
    try {
      var tvShow = await NetworkHelper.fecthTvShowById(showId);
      if (tvShow != null) {
        tvShowDetail.value = tvShow;
        print(tvShow.voteAverage);
      }
    } catch (e) {
      print("DetailController: $e");
    } finally {
      isLoading(false);
    }
  }
}
