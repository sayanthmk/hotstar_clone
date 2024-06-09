import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotstar/pages/page3/detailsrow.dart';
import 'package:hotstar/pages/page3/remindmebox.dart';
import 'package:hotstar/services/model.dart';
import 'package:hotstar/services/tmdb_service.dart';
import 'package:readmore/readmore.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final TMDBService _tmdbService = TMDBService();
  late Future<List<Movie>> _listSet;
  String text =
      "Flutter i such as hashtags, URLhat allows for dynamic expansion and c.";
  @override
  void initState() {
    super.initState();
    _listSet = listSetMovie();
  }

  Future<List<Movie>> listSetMovie() async {
    final results = await _tmdbService.fetchListSet();
    return results.map((movie) => Movie.fromJson(movie)).toList();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
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
              final listmovies = snapshot.data!;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final listmovie = listmovies[index];
                  return Column(
                    children: [
                      Container(
                        height: 200,
                        width: screenWidth,
                        decoration:
                            const BoxDecoration(color: Colors.amberAccent),
                        child: ClipRect(
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/w500${listmovie.posterPath}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 100,
                        width: screenWidth,
                        decoration: const BoxDecoration(color: Colors.black),
                        child: Center(
                          child: Text(
                            listmovie.title,
                            style: const TextStyle(
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
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      detailsrow(details: listmovie),
                      const SizedBox(
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
                      const SizedBox(
                        height: 20,
                      ),
                      remindmebox(listmovie: listmovie),
                      const SizedBox(
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
    );
  }
}
