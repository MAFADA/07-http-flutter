import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath!;
    } else {
      path =
          'https://blog.fluidui.com/content/images/2019/01/designernews.png';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title! + " /2031710168/M. Afada Nur Saiva Syahira"),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              height: height / 1.5,
              child: Image.network(path),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: <Widget>[
                      const Icon(Icons.star_rate_sharp),
                      const Padding(padding: EdgeInsets.only(top: 5)),
                      const Text("Rating"),
                      const Padding(padding: EdgeInsets.only(top: 5)),
                      Text(movie.voteAverage.toString()),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.date_range_rounded),
                      const Padding(padding: EdgeInsets.only(top: 5)),
                      const Text("Release Date"),
                      const Padding(padding: EdgeInsets.only(top: 5)),
                      Text(movie.releaseDate!),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.language_rounded),
                      const Padding(padding: EdgeInsets.only(top: 5)),
                      const Text("Language"),
                      const Padding(padding: EdgeInsets.only(top: 5)),
                      Text(movie.originalLanguage!.toUpperCase()),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                child: Text(movie.overview!),
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16)),
          ],
        )),
      ),
    );
  }
}
