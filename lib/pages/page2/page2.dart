import 'package:flutter/material.dart';
import 'package:hotstar/pages/page2/horizontalview.dart';
import 'package:hotstar/pages/page2/leftalignimage.dart';
import 'package:hotstar/pages/page2/rightalignimage.dart';
import 'package:hotstar/pages/page2/serachbar.dart';
import 'package:hotstar/services/model.dart';
import 'package:hotstar/services/tmdb_service.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final TMDBService _tmdbService = TMDBService();
  late Future<List<Movie>> comedySection;

  @override
  void initState() {
    comedySection = fetchComedyFunction();
    super.initState();
  }

  Future<List<Movie>> fetchComedyFunction() async {
    final results = await _tmdbService.fetchListSet();
    return results.map((movie) => Movie.fromJson(movie)).toList();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            // const SearchBar(),
            serachbar(),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Trending in",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            const HorizontalViewItems(),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder<List<Movie>>(
              future: comedySection,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Text(
                    'Error loading data',
                    style: TextStyle(color: Colors.white),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text(
                    'No data available',
                    style: TextStyle(color: Colors.white),
                  );
                } else {
                  final movies = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return Column(
                        children: [
                          LeftAlignImage(
                              screenWidth: screenWidth,
                              movie: movie,
                              index: index),
                          RightAlignImage(
                              screenWidth: screenWidth,
                              movie: movie,
                              index: index),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
