import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_and_shows/home/home_controller.dart';
import 'package:movies_and_shows/home/movie_carousel.dart';
import 'package:movies_and_shows/home/tv_show_carousel.dart';
import 'package:movies_and_shows/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.find<HomeController>();
  int rndNumber = Random().nextInt(8);

  @override
  Widget build(BuildContext context) {
    // TODO add image from Random movie and popular movies and shows carousels
    return Scaffold(
      backgroundColor: Color(0xFF333333),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              if (homeController.isLoading.value) {
                return SizedBox(
                    child: Center(
                  child: CircularProgressIndicator(),
                ));
              } else {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: Hero(
                              tag: 'Movie Poster',
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Image.network(
                                    '${Constants.basePosterURL}${Constants.bigPosterSize}${homeController.movieList[rndNumber].posterPath}',
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '${homeController.movieList[rndNumber].originalTitle}',
                                style: TextStyle(
                                  color: Color(0xffDCFFFD),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              Text(
                                '${homeController.movieList[rndNumber].title}',
                                style: TextStyle(
                                  color: Color(0xffDCFFFD),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 16.0, 0),
                            child: ElevatedButton(
                                onPressed: () => print(
                                    '${homeController.movieList[rndNumber].voteAverage}'),
                                child: Text('Watch'),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF4DF687),
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MovieCarousel(
                            movies: homeController.movieList,
                          ),
                          TvShowCarousel(
                            tvShows: homeController.showList,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
