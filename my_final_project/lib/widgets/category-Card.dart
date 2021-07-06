import 'package:flutter/material.dart';

Widget categoryCard(name, description) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
    height: 90,
    child: Card(
      child: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  description,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}