import 'package:flutter/material.dart';
import 'package:hotstar/pages/page3/detailsrow.dart';
import 'package:hotstar/services/model.dart';
import 'package:hotstar/services/tmdb_service.dart';

class TitlesMovies extends StatefulWidget {
  const TitlesMovies({
    super.key,
  });

  @override
  State<TitlesMovies> createState() => _TitlesMoviesState();
}

class _TitlesMoviesState extends State<TitlesMovies> {
  final TMDBService _tmdbService = TMDBService();
  late Future<List<Movie>> _movies;
  @override
  void initState() {
    super.initState();
    _movies = fetchMovies();
  }

  Future<List<Movie>> fetchMovies() async {
    final results = await _tmdbService.fetchMovies();
    return results.map((movie) => Movie.fromJson(movie)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Hindi",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
          ),
          dot(),
          const Text(
            "Romance",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
          ),
          dot(),
          const Text(
            "Food",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
          ),
          dot(),
          const Text(
            "Curlinary",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
