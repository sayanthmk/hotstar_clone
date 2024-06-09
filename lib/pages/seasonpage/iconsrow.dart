import 'package:flutter/material.dart';

Row iconsrow() {
  return const Row(
    children: [
      SizedBox(
        width: 30,
      ),
      Column(
        children: [
          Icon(
            Icons.add,
            color: Colors.white,
          ),
          Text(
            "Watchlist",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
      SizedBox(
        width: 50,
      ),
      Column(
        children: [
          Icon(
            Icons.send_outlined,
            color: Colors.white,
          ),
          Text(
            "Share",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
      SizedBox(
        width: 50,
      ),
      Column(
        children: [
          Icon(
            Icons.heart_broken,
            color: Colors.white,
          ),
          Text(
            "Rate",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    ],
  );
}
