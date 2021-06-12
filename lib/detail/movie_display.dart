import 'package:flutter/material.dart';
import 'package:movies_and_shows/models/movie.dart';
import 'package:movies_and_shows/utils/constants.dart';
import 'package:intl/intl.dart';

class MovieDisplay extends StatelessWidget {
  final DateFormat dateFormat = DateFormat("dd.MM.yyyy");
  final Movie movie;
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            width: 50,
                            height: 50,
                            child: new CircularProgressIndicator(
                              strokeWidth: 5,
                              value: 1.0,
                              valueColor: AlwaysStoppedAnimation(valueColor),
                            ),
                          ),
                        ),
                        Center(
                            child: Text(
                          movie.voteAverage.toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                      ],
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
                        alignment: Alignment.centerLeft,
                        width: 250,
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
                        width: 250,
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
                        onPressed: () => print('${movie.voteAverage}'),
                        child: Text('Watch'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF4DF687),
                        )),
                  ),
                ],
              ),
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
