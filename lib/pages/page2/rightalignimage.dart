import 'package:flutter/material.dart';
import 'package:hotstar/services/model.dart';

class RightAlignImage extends StatelessWidget {
  const RightAlignImage({
    super.key,
    required this.screenWidth,
    required Movie movie,
    required int index,
  });

  final double screenWidth;

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
                    width: screenWidth * 0.5,
                    color: Colors.black,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Image(
                        image: AssetImage('asset/disneyimage.webp'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 147,
                  width: screenWidth * 0.5,
                  color: Colors.black,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const Image(
                      image: AssetImage('asset/disneyimage.webp'),
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
                width: screenWidth * 0.5 - 16, // 50% of the screen width

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const Image(
                    image: AssetImage('asset/disneyimage.webp'),
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
                width: screenWidth * 0.33 - 10,
                color: Colors.black,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const Image(
                    image: AssetImage('asset/disneyimage.webp'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
              height: 170,
              width: screenWidth * 0.33,
              color: Colors.black,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const Image(
                  image: AssetImage('asset/disneyimage.webp'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3, right: 3),
              child: Container(
                height: 170,
                width: screenWidth * 0.33,
                color: Colors.black,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const Image(
                    image: AssetImage('asset/disneyimage.webp'),
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
