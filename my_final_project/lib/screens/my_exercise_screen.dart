import 'package:flutter/material.dart';
import 'package:my_final_project/config/palette.dart';
import 'package:my_final_project/screens/add_category_screen.dart';
import 'package:my_final_project/screens/add_exercise_screen.dart';

class myExerciseScreen extends StatelessWidget {
  const myExerciseScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 65),
          child: Text('Egzersizlerim'),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 580,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 265),
              child: PopupMenuButton(
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text('Kategori Ekle'),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text('Egzersiz Ekle'),
                  ),
                ],
                child: FloatingActionButton(
                  backgroundColor: Palette.darkGreen,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => addCategoryScreen()),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => addExerciseScreen()),
        );
        break;
    }
  }
}
