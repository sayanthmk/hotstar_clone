import 'package:flutter/material.dart';
import 'package:hotstar/pages/new&hot/detailsrow.dart';

class TitlesMovies extends StatefulWidget {
  const TitlesMovies({
    super.key,
  });

  @override
  State<TitlesMovies> createState() => _TitlesMoviesState();
}

class _TitlesMoviesState extends State<TitlesMovies> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Action",
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
            "Triller",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
          ),
          dot(),
          const Text(
            "Drama",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
