import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotstar/pages/seasonpage/iconsrow.dart';
import 'package:hotstar/pages/seasonpage/movierow.dart';
import 'package:hotstar/pages/seasonpage/summarytext.dart';
import 'package:hotstar/pages/seasonpage/tabbarseason.dart';
import 'package:hotstar/pages/seasonpage/watchlatestbox.dart';
import 'package:hotstar/services/model.dart';

class SeasonPage extends StatefulWidget {
  final Movie series;

  const SeasonPage({super.key, required this.series});

  @override
  State<SeasonPage> createState() => _SeasonPageState();
}

class _SeasonPageState extends State<SeasonPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://image.tmdb.org/t/p/w500${widget.series.posterPath}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.black),
                child: Center(
                  child: Text(
                    widget.series.title,
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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'New Season',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 16, 156, 243)),
                ),
              ),
              moviesrow(series: widget.series),
              const SizedBox(
                height: 20,
              ),
              watchlatestbox(),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  SummaryText(),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "NEW EPISODE EVERY WEEK. As the war intensifies in Ravan majestic Lanka, Hanuman Faces mightier foes for his Lord Ram with his vaanar sena",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              iconsrow(),
              const SizedBox(
                height: 30,
              ),
              /////////////////////////
              const TabbarViewModel(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            backgroundColor: Colors.transparent,
            child: const Icon(
              Icons.close,
              color: Colors.white,
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      ),
    );
  }
}
