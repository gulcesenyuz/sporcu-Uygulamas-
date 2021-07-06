import 'package:flutter/material.dart';

Widget exCardField(text, data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            data,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ],
  );
}

Widget exCardNameField(data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(bottom: 10, top: 5),
        child: Text(
          data,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}
