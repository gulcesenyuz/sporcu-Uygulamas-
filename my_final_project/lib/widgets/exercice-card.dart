import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'exercice-card-field.dart';

Widget exercicesCard(date, category, description, name, how, metod) {
  return Card(
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            exCardField('Egzersiz Adı:', name),
            exCardField('Egzersiz Kategorisi:', category),
            exCardField('Egzersiz Açıklaması', description),
            exCardField('Egzersiz Metodu', metod),
            exCardField('Egzersiz  nasıl yapılır:', how),
            exCardField('Oluşturulma:', date.toString()),
          ],
        ),
      ),
    ),
  );
}
