import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotstar/pages/page3/detailsrow.dart';
import 'package:hotstar/pages/page3/remindmebox.dart';
import 'package:hotstar/services/model.dart';
import 'package:hotstar/services/tmdb_service.dart';
import 'package:readmore/readmore.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final TMDBService _tmdbService = TMDBService();
  late Future<List<Movie>> _listSet;
  String _searchQuery = "";
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _listSet = listSetMovie();
  }

  Future<List<Movie>> listSetMovie() async {
    final results = await _tmdbService.fetchListSet();
    return results.map((movie) => Movie.fromJson(movie)).toList();
  }

  List<Movie> _filterMovies(List<Movie> movies) {
    return movies.where((movie) {
      final title = movie.title.toLowerCase();
      final searchQuery = _searchQuery.toLowerCase();
      return title.contains(searchQuery);
    }).toList();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _searchQuery = query;
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search movies',
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: _onSearchChanged,
            ),
          ),
          Expanded(
            child: SizedBox(
              child: FutureBuilder(
                future: _listSet,
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
                    final listmovies = _filterMovies(snapshot.data!);
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final listmovie = listmovies[index];
                        return Column(
                          children: [
                            Container(
                              height: 200,
                              width: screenWidth,
                              decoration:
                                  BoxDecoration(color: Colors.amberAccent),
                              child: ClipRect(
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://image.tmdb.org/t/p/w500${listmovie.posterPath}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 100,
                              width: screenWidth,
                              decoration: BoxDecoration(color: Colors.black),
                              child: Center(
                                child: Text(
                                  listmovie.title,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 30,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Releasing on ${listmovie.releasedate}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            detailsrow(details: listmovie),
                            SizedBox(
                              height: 10,
                            ),
                            ReadMoreText(
                              listmovie.overview,
                              trimLength: 47,
                              trimCollapsedText: "See more",
                              trimExpandedText: 'See less',
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            remindmebox(listmovie: listmovie),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        );
                      },
                      itemCount: listmovies.length,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
