import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotstar/pages/page1/latest_release.dart';
import 'package:hotstar/pages/page1/trending_movies.dart';
import 'package:hotstar/pages/page1/titles.dart';
import 'package:hotstar/services/model.dart';
import 'package:hotstar/services/tmdb_service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TMDBService _tmdbService = TMDBService();
  late Future<List<Movie>> _movies;
  int activeIndex = 0;

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
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              flexibleSpace: Column(
                children: [
                  FutureBuilder<List<Movie>>(
                    future: _movies,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text("Error:${snapshot.error}"),
                        );
                      } else {
                        final movies = snapshot.data!;
                        return CarouselSlider.builder(
                          itemCount: movies.length,
                          itemBuilder: (context, index, realInex) {
                            final movie = movies[index];
                            return buildImage(movie, index);
                          },
                          options: CarouselOptions(
                            height: 400,
                            viewportFraction: 1,
                            aspectRatio: 14 / 15,
                            autoPlay: true,
                            // viewportFraction = 0.8,
                            // enlargeCenterPage: true,
                            autoPlayInterval: const Duration(seconds: 5),
                            onPageChanged: (index, reason) => setState(() {
                              activeIndex = index;
                            }),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'asset/logodisney.png',
                  color: Colors.white,
                ),
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.cast_outlined,
                    color: Colors.white,
                    size: 25,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const TitlesMovies(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 74, 70, 70),
                  ),
                  height: 45,
                  width: 180,
                  child: const Center(
                      child: Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                      Text(
                        "Watch Now",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  )),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            buildindicator(),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Latest Releases",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const HorizontalLarge(),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Trending Movies",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const HorizontalSmall(),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Popular Shows",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const HorizontalLarge(),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Dubbed Delights",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const HorizontalSmall(),
          ],
        ),
      ),
    );
  }

  Widget buildImage(Movie movie, int index) => Container(
        color: Colors.yellow,
        height: double.infinity,
        width: double.infinity,
        child: ClipRRect(
          child: Image.network(
              fit: BoxFit.cover,
              'https://image.tmdb.org/t/p/w500${movie.posterPath}'),
        ),
      );
  Widget buildindicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 10,
        effect: const JumpingDotEffect(
            dotWidth: 6, dotHeight: 6, activeDotColor: Colors.white),
      );
}
