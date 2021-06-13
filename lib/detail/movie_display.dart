import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_and_shows/detail/detail_controller.dart';
import 'package:movies_and_shows/models/movie.dart';
import 'package:movies_and_shows/utils/constants.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDisplay extends StatelessWidget {
  final DateFormat dateFormat = DateFormat("dd.MM.yyyy");
  final Movie movie;
  final detailController = Get.find<DetailController>();
  MovieDisplay({@required this.movie});
  @override
  Widget build(BuildContext context) {
    Color valueColor = Colors.blueAccent;
    if (movie.voteAverage >= 8.0)
      valueColor = Colors.green[400];
    else if (7 <= movie.voteAverage && movie.voteAverage < 8)
      valueColor = Colors.orange[300];
    else
      valueColor = Colors.red[400];
    print("Movie: ${movie.originalTitle}");
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Container(
                height: MediaQuery.of(context).size.width + 50,
                child: Hero(
                  tag: 'Movie Poster',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                        '${Constants.basePosterURL}${Constants.bigPosterSize}${movie.posterPath}',
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40.0,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: 40,
                              height: 40,
                              child: new CircularProgressIndicator(
                                strokeWidth: 3,
                                value: 1.0,
                                valueColor: AlwaysStoppedAnimation(valueColor),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 40,
                              child: Text(
                                movie.voteAverage.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 200,
                      child: Text(
                        '${movie.originalTitle}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xffDCFFFD),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Movie',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 16.0, 0),
                  child: ElevatedButton(
                      onPressed: () {
                        detailController.fetchMovieVideo(movie.id);
                        return showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Trailer'),
                            content: Obx(
                              () {
                                if (detailController.isMovieLoading.value) {
                                  return Container(
                                    width: 200,
                                    height: 200,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                } else {
                                  if (detailController.movieVideoObs.value !=
                                      null) {
                                    if (detailController.movieVideoObs.value
                                            .results[0].site ==
                                        "YouTube") {
                                      return YoutubePlayer(
                                        controller: YoutubePlayerController(
                                          initialVideoId: detailController
                                              .movieVideoObs
                                              .value
                                              .results[0]
                                              .key,
                                          flags: YoutubePlayerFlags(
                                              autoPlay: false),
                                        ),
                                        showVideoProgressIndicator: true,
                                        progressIndicatorColor: Colors.amber,
                                      );
                                    } else {
                                      return Text("No trailer is available.");
                                    }
                                  } else {
                                    return Text("No trailer is available.");
                                  }
                                }
                              },
                            ),
                          ),
                        );
                      },
                      child: Text('Watch'),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF4DF687),
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Release Date',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 18.0,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      dateFormat.format(movie.releaseDate),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xffDCFFFD),
                        fontSize: 18.0,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 8.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Description',
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 18.0,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        movie.overview,
                        style: TextStyle(
                          color: Color(0xffDCFFFD),
                          fontSize: 18.0,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
