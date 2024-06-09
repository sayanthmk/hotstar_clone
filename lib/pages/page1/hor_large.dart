import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotstar/pages/seasonpage/seasonpage.dart';
import 'package:hotstar/services/model.dart';
import 'package:hotstar/services/tmdb_service.dart';

class HorizontalLarge extends StatefulWidget {
  const HorizontalLarge({super.key});

  @override
  State<HorizontalLarge> createState() => _HorizontalLargeState();
}

class _HorizontalLargeState extends State<HorizontalLarge> {
  final TMDBService _tmdbService = TMDBService();
  late Future<List<Movie>> _series;

  /////series//////

  Future<List<Movie>> seriesData() async {
    final results = await _tmdbService.fetchMovies();
    return results.map((movie) => Movie.fromJson(movie)).toList();
  }

  @override
  void initState() {
    super.initState();
    _series = seriesData();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 160,
        child: FutureBuilder(
          future: _series,
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
              final series = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: series.length,
                itemBuilder: (context, index) {
                  final seriesset = series[index];
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SeasonPage(series: seriesset),
                        ));
                      },
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                        ),
                        child: ClipRect(
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/w500${seriesset.posterPath}',
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

// import 'package:flutter/material.dart';


// SizedBox horizontalscrolllarge() {
//   return SizedBox(
//     height: 160,
//     child: ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemCount: 10,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.all(3.0),
//           child: InkWell(
//             onTap: () {},
//             child: Container(
//               width: 120,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 color: Colors.grey,
//               ),
//               child: Center(
//                 child: Text("Item $index"),
//               ),
//             ),
//           ),
//         );
//       },
//     ),
//   );
// }