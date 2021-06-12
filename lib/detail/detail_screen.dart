import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_and_shows/detail/movie_display.dart';
import 'package:movies_and_shows/detail/show_display.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Get.arguments[1] == "movie"
        ? MovieDisplay(movie: Get.arguments[0])
        : ShowDisplay(tvShow: Get.arguments[0]);
  }
}
