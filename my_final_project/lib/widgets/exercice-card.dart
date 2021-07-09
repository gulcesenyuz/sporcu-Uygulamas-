import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_final_project/screens/auth/widgets/delete.dart';

import 'exercice-card-field.dart';

Widget exercicesCard(date, category, description, name, how, metod, context,
    collection, data, deviceSize) {
  return Card(
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: exCardNameField(name)),
            exCardField('Egzersiz Açıklaması: ', description),
            exCardField('Egzersiz Metodu: ', metod),
            exCardField('Egzersiz  nasıl yapılır: ', how),
            exCardField('Oluşturulma: ', date.toString()),
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
