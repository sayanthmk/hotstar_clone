import 'package:flutter/material.dart';

class SummaryText extends StatelessWidget {
  const SummaryText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          "Mythology",
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        SizedBox(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "|",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
