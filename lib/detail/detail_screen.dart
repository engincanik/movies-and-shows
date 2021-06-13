import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_and_shows/detail/detail_controller.dart';
import 'package:movies_and_shows/detail/movie_display.dart';
import 'package:movies_and_shows/detail/show_display.dart';
import 'package:movies_and_shows/models/tv_show_detail.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final detailController = Get.find<DetailController>();
  TvShowDetail tvShowDetail;
  @override
  Widget build(BuildContext context) {
    if (Get.arguments[1] != 'movie') {
      detailController.fetchTvShowById(Get.arguments[0].id);
    }
    return Scaffold(
      backgroundColor: Color(0xFF333333),
      body: Get.arguments[1] == "movie"
          ? MovieDisplay(movie: Get.arguments[0])
          : Obx(
              () {
                if (detailController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ShowDisplay(
                      tvShow: detailController.tvShowDetail.value);
                }
              },
            ),
    );
  }
}
