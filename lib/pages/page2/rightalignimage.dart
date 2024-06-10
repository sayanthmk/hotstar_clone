import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotstar/services/model.dart';

class RightAlignImage extends StatefulWidget {
  const RightAlignImage({
    super.key,
    required this.screenWidth,
    required this.movie,
    required int index,
  });

  final double screenWidth;
  final Movie movie;

  @override
  State<RightAlignImage> createState() => _RightAlignImageState();
}

class _RightAlignImageState extends State<RightAlignImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: Container(
                    height: 150,
                    width: widget.screenWidth * 0.5,
                    color: Colors.black,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 147,
                  width: widget.screenWidth * 0.5,
                  color: Colors.black,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: 300,
                width: widget.screenWidth * 0.5 - 16, // 50% of the screen width

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 3, right: 3),
              child: Container(
                height: 170,
                width: widget.screenWidth * 0.33 - 10,
                color: Colors.black,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
              height: 170,
              width: widget.screenWidth * 0.33,
              color: Colors.black,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3, right: 3),
              child: Container(
                height: 170,
                width: widget.screenWidth * 0.33,
                color: Colors.black,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
