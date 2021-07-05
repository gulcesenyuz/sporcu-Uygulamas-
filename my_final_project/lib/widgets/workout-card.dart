import 'package:flutter/material.dart';
import 'package:my_final_project/config/palette.dart';

import 'exercice-card-field.dart';

Widget workoutCard(score, sets, tekrar, ex1, ex2, ex3) {
  return Card(
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            exCardField('Score:', score),
            exCardField('Set Sayısı:', sets),
            exCardField('Tekrar Sayısı', tekrar),
            exCardField('Egzersiz 1', ex1),
            exCardField('Egzersiz 2', ex2),
            exCardField('Egzersiz 3', ex3),
          ],
        ),
      ),
    ),
  );
}

Widget scoreCard(score, sets, tekrar, ex1, ex2, ex3) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
    child: Card(
      child: Container(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  exCardField('Set Sayısı:', sets),
                  exCardField('Tekrar Sayısı', tekrar),
                  exCardField('Egzersiz 1', ex1),
                  exCardField('Egzersiz 2', ex2),
                  exCardField('Egzersiz 3', ex3),
                ],
              ),
            ),
            SizedBox(
              width: 60,
            ),
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Palette.orange,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  score,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
