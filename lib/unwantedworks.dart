  // Container(
            //   height: 200,
            //   width: 200,
            //   decoration: BoxDecoration(
            //     // borderRadius: BorderRadius.circular(30),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey.withOpacity(0.5),
            //         spreadRadius: 1,
            //         blurRadius: 7,
            //         offset: const Offset(0, 3), // changes position of shadow
            //       ),
            //     ],
            //   ),
            //   // child: const CircleAvatar(
            //   //   backgroundImage: AssetImage("asset/disneyimage.webp"),
            //   // ),
            // ),
            // Stack(clipBehavior: Clip.hardEdge, children: [
            //   Image(
            //     image: AssetImage("asset/disneyimage.webp"),
            //     width: 360,
            //     height: 360,
            //   ),
            //   BackdropFilter(
            //     filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
            //     child: Image(
            //       image: AssetImage("asset/disneyimage.webp"),
            //       width: 350,
            //       height: 350,
            //     ),
            //   ),
            // ]),
            // child: CarouselSlider.builder(
//                       itemCount: images.length,
//                       itemBuilder: (context, index, realInex) {
//                         final assetimage = images[index];
//                         return buildImage(assetimage, index);
//                       },
//                       options: CarouselOptions(
//                         height: 400,
//                         autoPlay: true,
//                         // enlargeCenterPage: true,
//                         autoPlayInterval: const Duration(seconds: 5),
//                         onPageChanged: (index, reason) => setState(() {
//                           activeIndex = index;
//                         }),
//                       ),
//                     ),
  // final images = [
  //   'asset/disneyimage.webp',
  //   'asset/disneyimage.webp',
  //   'asset/disneyimage.webp',
  //   'asset/disneyimage.webp',
  //   'asset/disneyimage.webp',
  //   'asset/disneyimage.webp',
  //   'asset/disneyimage.webp',
  //   'asset/disneyimage.webp',
  // ];
  ///////////////////////////////////searc/////////////////////////////////
//   import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:hotstar/pages/page3/detailsrow.dart';
// import 'package:hotstar/pages/page3/remindmebox.dart';
// import 'package:hotstar/services/model.dart';
// import 'package:hotstar/services/tmdb_service.dart';
// import 'package:readmore/readmore.dart';

// class ThirdPage extends StatefulWidget {
//   const ThirdPage({Key? key}) : super(key: key);

//   @override
//   State<ThirdPage> createState() => _ThirdPageState();
// }

// class _ThirdPageState extends State<ThirdPage> {
//   final TMDBService _tmdbService = TMDBService();
//   late Future<List<Movie>> _listSet;
//   String _searchQuery = "";

//   @override
//   void initState() {
//     super.initState();
//     _listSet = listSetMovie();
//   }

//   Future<List<Movie>> listSetMovie() async {
//     final results = await _tmdbService.fetchListSet();
//     return results.map((movie) => Movie.fromJson(movie)).toList();
//   }

//   List<Movie> _filterMovies(List<Movie> movies) {
//     return movies.where((movie) {
//       final title = movie.title.toLowerCase();
//       final searchQuery = _searchQuery.toLowerCase();
//       return title.contains(searchQuery);
//     }).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search movies',
//                 hintStyle: TextStyle(color: Colors.grey),
//                 fillColor: Colors.white,
//                 filled: true,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   _searchQuery = value;
//                 });
//               },
//             ),
//           ),
//           Expanded(
//             child: SizedBox(
//               child: FutureBuilder(
//                 future: _listSet,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   } else if (snapshot.hasError) {
//                     return const Center(
//                       child: Text("Error"),
//                     );
//                   } else {
//                     final listmovies = _filterMovies(snapshot.data!);
//                     return ListView.builder(
//                       itemBuilder: (context, index) {
//                         final listmovie = listmovies[index];
//                         return Column(
//                           children: [
//                             Container(
//                               height: 200,
//                               width: screenWidth,
//                               decoration: BoxDecoration(color: Colors.amberAccent),
//                               child: ClipRect(
//                                 child: CachedNetworkImage(
//                                   imageUrl: 'https://image.tmdb.org/t/p/w500${listmovie.posterPath}',
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             Container(
//                               height: 100,
//                               width: screenWidth,
//                               decoration: BoxDecoration(color: Colors.black),
//                               child: Center(
//                                 child: Text(
//                                   listmovie.title,
//                                   style: TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 30,
//                                     overflow: TextOverflow.ellipsis,
//                                     fontFamily: 'Montserrat',
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Text(
//                                     'Releasing on ${listmovie.releasedate}',
//                                     style: TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w700,
//                                         color: Colors.white),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             detailsrow(details: listmovie),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             ReadMoreText(
//                               listmovie.overview,
//                               trimLength: 47,
//                               trimCollapsedText: "See more",
//                               trimExpandedText: 'See less',
//                               textAlign: TextAlign.left,
//                               style: TextStyle(color: Colors.grey[400]),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             remindmebox(listmovie: listmovie),
//                             SizedBox(
//                               height: 20,
//                             )
//                           ],
//                         );
//                       },
//                       itemCount: listmovies.length,
//                     );
//                   }
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Movie {
//   final String title;
//   final String releasedate;
//   final String overview;
//   final String posterPath;

//   Movie({
//     required this.title,
//     required this.releasedate,
//     required this.overview,
//     required this.posterPath,
//   });

//   factory Movie.fromJson(Map<String, dynamic> json) {
//     return Movie(
//       title: json['title'] ?? '',
//       releasedate: json['release_date'] ?? '',
//       overview: json['overview'] ?? '',
//       posterPath: json['poster_path'] ?? '',
//     );
//   }
// }

// class TMDBService {
//   Future<List<dynamic>> fetchListSet() async {
//     // Simulating API call, replace with actual API call
//     // For demonstration, returning a list of dummy movie data
//     return [
//       {
//         "title": "Movie 1",
//         "release_date": "2024-01-01",
//         "overview": "Overview of Movie 1",
//         "poster_path": "/abc.jpg"
//       },
//       {
//         "title": "Movie 2",
//         "release_date": "2024-02-01",
//         "overview": "Overview of Movie 2",
//         "poster_path": "/def.jpg"
//       },
//       // Add more movie data here as needed
//     ];
//   }
// }

// detailsrow and remindmebox widgets are assumed to be defined elsewhere
