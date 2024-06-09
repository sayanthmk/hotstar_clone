import 'package:flutter/material.dart';

class SeasonTileBar extends StatelessWidget {
  const SeasonTileBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400, // Set a fixed height for the ListView
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Container(
                height: 60,
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Align(
                    alignment: const Alignment(-1.5, 3),
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.play_arrow))),
              ),
              trailing: const Icon(
                Icons.download,
                color: Colors.grey,
              ),
              title: Text(
                "The Legend Begins $index",
                style: const TextStyle(color: Colors.grey),
              ),
              subtitle: Row(
                children: [
                  const Text(
                    "S1E1",
                    style: TextStyle(color: Colors.grey),
                  ),
                  dotseason(),
                  const Text(
                    "29 Jan 2021",
                    style: TextStyle(color: Colors.grey),
                  ),
                  dotseason(),
                  const Text(
                    "23 m",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

SizedBox dotseason() {
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
