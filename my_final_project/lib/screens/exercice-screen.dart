import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:my_final_project/widgets/exercice-card.dart';

class ExerciseScreen extends StatefulWidget {
  String exName;

  ExerciseScreen({this.exName});
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 65),
          child: Text('Egzersizlerim'),
        ),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: deviceSize.height * 0.03,
                  bottom: deviceSize.height * 0.02),
              child: Container(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Exercices')
                      .where('category', isEqualTo: widget.exName)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    print(widget.exName);
                    print(snapshot.data);

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
                          final DocumentSnapshot data =
                              snapshot.data.docs[index];
                          print(data.data());
                          if (data['created'].toDate() == null)
                            Center(child: CircularProgressIndicator());
                          return exercicesCard(
                              data['created'].toDate(),
                              data['category'],
                              data['exercice description'],
                              data['exercice name'],
                              data['nasıl yapılır'],
                              data['method']);
                        });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
