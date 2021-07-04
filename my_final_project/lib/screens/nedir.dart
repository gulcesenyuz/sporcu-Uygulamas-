import 'package:flutter/material.dart';
import 'package:my_final_project/config/palette.dart';
import 'package:my_final_project/model/exercise.dart';
import 'package:my_final_project/screens/exercise_details_screen.dart';

class nedirPage extends StatelessWidget {
  const nedirPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nedir ?'),
        backgroundColor: Palette.darkOrange,
      ),
      body: ListView.builder(
          itemCount: exerciseList.length,
          itemBuilder: (context, index) {
            Exercise exercise = exerciseList[index];
            return Card(
              child: ListTile(
                title: Text(exercise.title),
                subtitle: Text(exercise.description),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ExerciseDetailsScreen(exercise))),
              ),
            );
          }),
    );
  }
}
