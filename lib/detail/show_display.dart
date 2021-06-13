import 'package:flutter/material.dart';
import 'package:movies_and_shows/models/tv_show.dart';
import 'package:movies_and_shows/models/tv_show_detail.dart';
import 'package:movies_and_shows/utils/constants.dart';
import 'package:intl/intl.dart';

class ShowDisplay extends StatelessWidget {
  final DateFormat dateFormat = DateFormat("dd.MM.yyyy");
  final TvShowDetail tvShow;
  ShowDisplay({@required this.tvShow});

  @override
  Widget build(BuildContext context) {
    Color valueColor = Colors.blueAccent;
    print("BuildContext ${tvShow.id}");
    if (tvShow.voteAverage >= 8.0)
      valueColor = Colors.green[400];
    else if (7 <= tvShow.voteAverage && tvShow.voteAverage < 8)
      valueColor = Colors.orange[300];
    else
      valueColor = Colors.red[400];

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
                        '${Constants.basePosterURL}${Constants.bigPosterSize}${tvShow.posterPath}',
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
                        height: 50.0,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              child: new CircularProgressIndicator(
                                strokeWidth: 3,
                                value: 1.0,
                                valueColor: AlwaysStoppedAnimation(valueColor),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 50,
                              child: Text(
                                tvShow.voteAverage.toString(),
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
                        '${tvShow.name}',
                        style: TextStyle(
                          color: Color(0xffDCFFFD),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 200,
                      child: Text(
                        'TV Show',
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
                      onPressed: () => print('${tvShow.voteAverage}'),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Seasons',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 18.0,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Total Episode',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 18.0,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          tvShow.numberOfSeasons.toString(),
                          style: TextStyle(
                            color: Color(0xffDCFFFD),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            tvShow.numberOfEpisodes.toString(),
                            style: TextStyle(
                              color: Color(0xffDCFFFD),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: Container(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        dateFormat.format(tvShow.firstAirDate),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xffDCFFFD),
                          fontSize: 18.0,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 0),
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
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        tvShow.overview,
                        style: TextStyle(
                          color: Color(0xffDCFFFD),
                          fontSize: 18.0,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
