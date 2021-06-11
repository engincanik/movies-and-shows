import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_and_shows/models/tv_show.dart';
import 'package:movies_and_shows/utils/constants.dart';

class TvShowCarousel extends StatelessWidget {
  final List<TvShow> tvShows;
  TvShowCarousel({this.tvShows});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Popular Tv Shows',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tvShows.length,
            itemBuilder: (BuildContext context, int index) {
              TvShow tvShow = tvShows[index];
              return GestureDetector(
                onTap: () => Get.toNamed('/splash'),
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  width: 200.0,
                  height: 300.0,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0,
                            )
                          ],
                        ),
                        child: Stack(
                          children: <Widget>[
                            Hero(
                              tag: tvShow.posterPath,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.network(
                                  '${Constants.basePosterURL}${Constants.mediumPosterSize}${tvShow.posterPath}',
                                  width: 300,
                                  height: 300,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
