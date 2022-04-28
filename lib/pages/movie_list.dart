import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http_request/service/http_service.dart';

import 'movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
  late HttpService service;
}

class _MovieListState extends State<MovieList> {
  int? moviesCount;
  List? movies;
  HttpService? service;

  Future initialize() async {
    movies = [];
    movies = (await service!.getPopularMovies())!;
    setState(() {
      moviesCount = movies!.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _random = Random();
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text("Popular Movies/2031710168,M. Afada Nur Saiva Syahira"),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3,
          ),
          itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
          itemBuilder: (context, int position) {
            return Card(
              elevation: 2.0,
              child: ListTile(
                tileColor:
                    Colors.primaries[_random.nextInt(Colors.primaries.length)]
                        [_random.nextInt(9) * 100],
                leading: Image.network(
                  'https://image.tmdb.org/t/p/w500/' +
                      movies![position].posterPath,
                  fit: BoxFit.cover,
                ),
                title: Text(movies![position].title),
                subtitle: Text(
                    'Rating = ' + movies![position].voteAverage.toString()),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MovieDetail(movies![position]);
                  }));
                },
              ),
            );
          }),
    );
  }
}
