import 'package:flutter/material.dart';
import 'package:my_final_project/config/palette.dart';
import 'package:my_final_project/screens/auth/widgets/delete.dart';

import 'exercice-card-field.dart';

Widget workoutCard(name, score, sets, tekrar, ex1, ex2, ex3, context,
    collection, data, deviceSize) {
  return Card(
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: exCardNameField(name),
            ),
            exCardField('Score: ', score),
            exCardField('Set Sayısı: ', sets),
            exCardField('Tekrar Sayısı: ', tekrar),
            exCardField('Egzersiz 1: ', ex1),
            exCardField('Egzersiz 2: ', ex2),
            exCardField('Egzersiz 3: ', ex3),
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  pdfDeleteBox(context, collection, data, deviceSize);
                }),
          ],
        ),
      ),
    ),
  );
}

Widget scoreCard(time, name, score, sets, tekrar, ex1, ex2, ex3, deviceSize) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
    child: Card(
      child: Container(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: exCardNameField(name),
                ),
                exCardField('Set Sayısı: ', sets),
                exCardField('Tekrar Sayısı: ', tekrar),
                exCardField('Egzersiz 1: ', ex1),
                exCardField('Egzersiz 2: ', ex2),
                exCardField('Egzersiz 3: ', ex3),
                exCardField('Tarih: ', time.toString())
              ],
            ),
          ),
          SizedBox(
            width: 50,
          ),
          Container(
            margin: EdgeInsets.only(left: deviceSize.width - 180, bottom: 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text('Score: '),
                ),
                Container(
                  width: 90,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Palette.orange,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      score,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    ),
  );
}
