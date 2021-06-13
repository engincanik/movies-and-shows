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
  bool connectionInfo = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF333333),
      body: SafeArea(
        child: SingleChildScrollView(
          child: connectionInfo == true
              ? Obx(() {
                  if (homeController.isLoadingMovies.value ||
                      homeController.isLoadingTvShows.value) {
                    return Center(
                      heightFactor: 20,
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () => {
                                  Get.toNamed(
                                    '/detail',
                                    arguments: [
                                      homeController.movieList[rndNumber],
                                      'movie',
                                    ],
                                  ),
                                },
                                child: Container(
                                  height: MediaQuery.of(context).size.width,
                                  child: Hero(
                                    tag: 'Movie Poster',
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.network(
                                          '${Constants.basePosterURL}${Constants.bigPosterSize}${homeController.movieList[rndNumber].posterPath}',
                                          width:
                                              MediaQuery.of(context).size.width,
                                          fit: BoxFit.fill),
                                    ),
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
                                  Container(
                                    width: 250,
                                    child: Text(
                                      '${homeController.movieList[rndNumber].originalTitle}',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color(0xffDCFFFD),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 250,
                                    child: Text(
                                      'Movie',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 16.0,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 0, 16.0, 0),
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
                })
              : Center(
                  heightFactor: 30,
                  child: Text(
                    "No Internet Connection.",
                    style: TextStyle(
                      color: Color(0xffDCFFFD),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
