import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_final_project/config/palette.dart';
import 'package:my_final_project/screens/exercise_details_screen.dart';

class NedirPage extends StatelessWidget {
  const NedirPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nedir ?'),
        backgroundColor: Palette.darkOrange,
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Videos').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.data == null)
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                ),
              );
            final length = snapshot.data.docs.length;
            print(length);
            return ListView.builder(
                shrinkWrap: true,
                itemCount: length,
                itemBuilder: (context, int index) {
                  final DocumentSnapshot data = snapshot.data.docs[index];
                  print(data.data());

                  return Card(
                    child: ListTile(
                      title: Text(data['dataName']),
                      subtitle: Text("Detaylı Anlatım İçin Tıklayın."),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExerciseDetailsScreen(
                                    name: data['dataName'],
                                    info: data['info'],
                                    link: data["dataUrl"],
                                  ))),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
