import 'package:flutter/material.dart';

Widget exCardField(text, data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Text(data),
    ],
  );
}
