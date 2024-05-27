import 'package:flutter/material.dart';

Widget buildPoint(
  // BuildContext context,
  String text,
) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0, right: 8, left: 8),
    child: Text(
      text,
      style: TextStyle(fontSize: 16),
      textAlign: TextAlign.justify,
      softWrap:
          true, // Ensures text wraps to a new line when it reaches the edge of the screen
    ),
  );
}

Widget buildText(
  // BuildContext context,
  String text,
) {
  return Padding(
    padding: const EdgeInsets.only(right: 1, left: 1),
    child: Wrap(children: [
      Text(
        text,
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.justify,
        softWrap:
            true, // Ensures text wraps to a new line when it reaches the edge of the screen
      ),
    ]),
  );
}
