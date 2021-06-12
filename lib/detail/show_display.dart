import 'package:flutter/material.dart';
import 'package:movies_and_shows/models/tv_show.dart';
import 'package:movies_and_shows/utils/constants.dart';

class ShowDisplay extends StatelessWidget {
  final TvShow tvShow;
  ShowDisplay({@required this.tvShow});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width + 50,
                  child: Hero(
                    tag: 'Movie Poster',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                          '${Constants.basePosterURL}${Constants.bigPosterSize}${tvShow.posterPath}',
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
                      '${tvShow.name}',
                      style: TextStyle(
                        color: Color(0xffDCFFFD),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Text(
                      '${tvShow.name}',
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
                      onPressed: () => print('${tvShow.voteAverage}'),
                      child: Text('Watch'),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF4DF687),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
