import 'package:flutter/material.dart';
import 'package:my_final_project/screens/auth/widgets/delete.dart';

Widget categoryCard(name, description, context, collection, data, deviceSize) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
    child: Card(
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
                maxLines: 5,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
              ),
              IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    pdfDeleteBox(context, collection, data, deviceSize);
                  }),
            ],
          ),
        ),
      ),
    ),
  );
}
