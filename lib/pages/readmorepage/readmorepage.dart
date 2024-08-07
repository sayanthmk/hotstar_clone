import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotstar/services/model.dart';
import 'package:hotstar/services/tmdb_service.dart';

class ReadMorePage extends StatefulWidget {
  const ReadMorePage({super.key});

  @override
  State<ReadMorePage> createState() => _ReadMorePageState();
}

class _ReadMorePageState extends State<ReadMorePage> {
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
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
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
