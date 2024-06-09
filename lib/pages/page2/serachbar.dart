import 'package:flutter/material.dart';

Padding serachbar() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            hintText: 'Movies, shows and more',
            prefixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 35,
                )),
            suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.mic_none,
                  size: 35,
                )),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))))),
  );
}
