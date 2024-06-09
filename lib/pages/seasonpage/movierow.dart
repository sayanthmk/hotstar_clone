import 'package:flutter/material.dart';

Row moviesrow({required series}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        series.title,
        style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w800),
      ),
      moviesdotset(),
      Text(
        // series.language,
        "English",
        style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w800),
      ),
      moviesdotset(),
      Container(
        height: 18,
        width: 25,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(2)),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "U",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    ],
  );
}

SizedBox moviesdotset() {
  return SizedBox(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        Icons.circle,
        size: 6,
        color: Colors.grey[400],
      ),
    ),
  );
}
