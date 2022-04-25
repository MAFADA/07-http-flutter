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
    return Scaffold(
      appBar: AppBar(
        title: Text("2031710168,M. Afada Nur Saiva Syahira/Popular Movies"),
      ),
      body: ListView.builder(
          itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
          itemBuilder: (context, int position) {
            return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
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
