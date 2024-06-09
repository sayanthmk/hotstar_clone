import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotstar/services/model.dart';
import 'package:hotstar/services/tmdb_service.dart';

class HorizontalSmall extends StatefulWidget {
  const HorizontalSmall({super.key});

  @override
  State<HorizontalSmall> createState() => _HorizontalSmallState();
}

class _HorizontalSmallState extends State<HorizontalSmall> {
  final TMDBService _tmdbService = TMDBService();
  late Future<List<Movie>> _nowplaying;

  Future<List<Movie>> nowplaying() async {
    final results = await _tmdbService.fetchNowPlayingMovies();
    return results.map((movie) => Movie.fromJson(movie)).toList();
  }

  @override
  void initState() {
    super.initState();
    _nowplaying = nowplaying();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 120,
        child: FutureBuilder(
          future: _nowplaying,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Error"),
              );
            } else {
              final nowplaying = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  final nowplaylist = nowplaying[index];
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey,
                        ),
                        child: ClipRect(
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/w500${nowplaylist.posterPath}',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}
