import 'package:flutter/material.dart';
import 'package:hotstar/pages/page2/horizontalview.dart';
import 'package:hotstar/pages/page2/leftalignimage.dart';
import 'package:hotstar/pages/page2/rightalignimage.dart';
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
            // serachbar(),
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
// import 'package:flutter/material.dart';
// import 'package:hotstar/pages/page2/horizontalview.dart';
// import 'package:hotstar/pages/page2/leftalignimage.dart';
// import 'package:hotstar/pages/page2/rightalignimage.dart';
// import 'package:hotstar/services/model.dart';
// import 'package:hotstar/services/tmdb_service.dart';

// class SecondPage extends StatefulWidget {
//   const SecondPage({super.key});

//   @override
//   State<SecondPage> createState() => _SecondPageState();
// }

// class _SecondPageState extends State<SecondPage> {
//   final TMDBService _tmdbService = TMDBService();
//   late Future<List<Movie>> comedySection;
//   List<Movie> _filteredMovies = [];
//   List<Movie> _allMovies = [];
//   TextEditingController _searchController = TextEditingController();
//   String _searchQuery = '';

//   @override
//   void initState() {
//     comedySection = fetchComedyFunction();
//     super.initState();
//   }

//   Future<List<Movie>> fetchComedyFunction() async {
//     final results = await _tmdbService.fetchListSet();
//     final movies = results.map((movie) => Movie.fromJson(movie)).toList();
//     setState(() {
//       _allMovies = movies;
//       _filteredMovies = movies;
//     });
//     return movies;
//   }

//   void _filterMovies() {
//     setState(() {
//       _filteredMovies = _searchQuery.isEmpty
//           ? _allMovies
//           : _allMovies.where((movie) {
//               final titleLower = movie.title.toLowerCase();
//               final searchLower = _searchQuery.toLowerCase();
//               return titleLower.contains(searchLower);
//             }).toList();
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 10,
//             ),
//             _buildSearchBar(),
//             const Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     "Trending in",
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//             const HorizontalViewItems(),
//             const SizedBox(
//               height: 20,
//             ),
//             FutureBuilder<List<Movie>>(
//               future: comedySection,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const CircularProgressIndicator();
//                 } else if (snapshot.hasError) {
//                   return const Text(
//                     'Error loading data',
//                     style: TextStyle(color: Colors.white),
//                   );
//                 } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return const Text(
//                     'No data available',
//                     style: TextStyle(color: Colors.white),
//                   );
//                 } else {
//                   return ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: _filteredMovies.length,
//                     itemBuilder: (context, index) {
//                       final movie = _filteredMovies[index];
//                       return Column(
//                         children: [
//                           LeftAlignImage(
//                               screenWidth: screenWidth,
//                               movie: movie,
//                               index: index),
//                           RightAlignImage(
//                               screenWidth: screenWidth,
//                               movie: movie,
//                               index: index),
//                         ],
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Padding _buildSearchBar() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextFormField(
//         controller: _searchController,
//         onChanged: (value) {
//           setState(() {
//             _searchQuery = value;
//             _filterMovies();
//           });
//         },
//         decoration: InputDecoration(
//             filled: true,
//             fillColor: Colors.grey[200],
//             hintText: 'Movies, shows and more',
//             prefixIcon: IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.search,
//                   size: 35,
//                 )),
//             suffixIcon: IconButton(
//                 onPressed: () {
//                   _searchController.clear();
//                   setState(() {
//                     _searchQuery = '';
//                     _filterMovies();
//                   });
//                 },
//                 icon: const Icon(
//                   Icons.mic_none,
//                   size: 35,
//                 )),
//             border: const OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(10))))),
//     );
//   }
// }
