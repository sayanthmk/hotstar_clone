import 'package:flutter/material.dart';

class HorizontalViewItems extends StatefulWidget {
  const HorizontalViewItems({super.key});

  @override
  State<HorizontalViewItems> createState() => _HorizontalViewItemsState();
}

class _HorizontalViewItemsState extends State<HorizontalViewItems> {
  List<String> items = [
    'All',
    'Movies',
    'Shows',
    'Actions',
    'Comedy',
    'Crime',
    'Drama',
    'Triller',
    'Romance'
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey)),
                child: Center(
                  child: Text(
                    items[index],
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
