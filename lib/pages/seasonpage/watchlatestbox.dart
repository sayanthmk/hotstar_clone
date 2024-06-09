import 'package:flutter/material.dart';

Container watchlatestbox() {
  return Container(
    height: 50,
    width: 380,
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.arrow_right_outlined,
          size: 40,
        ),
        Text(
          "Watch Latest Free Episode",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: 10,
        ),
        Text("2 Jun")
      ],
    ),
  );
}
