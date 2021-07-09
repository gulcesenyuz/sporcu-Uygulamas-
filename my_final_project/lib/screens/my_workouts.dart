import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_final_project/config/palette.dart';
import 'package:my_final_project/widgets/workout-card.dart';

import 'add-egitim.dart';

class WorkoutsCard extends StatefulWidget {
  const WorkoutsCard({Key key}) : super(key: key);

  @override
  _WorkoutsCardState createState() => _WorkoutsCardState();
}

class _WorkoutsCardState extends State<WorkoutsCard> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 85),
          child: Text('Eğitimlerim'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Container(
            height: 700,
            child: Padding(
              padding: EdgeInsets.only(
                  top: deviceSize.height * 0.03,
                  bottom: deviceSize.height * 0.02),
              child: Container(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Egitimler')
                      .orderBy('score', descending: true)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
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
                          if (data['egzersiz1'] == 'egzersiz' ||
                              data['egzersiz2'] == 'egzersiz' ||
                              data['egzersiz3'] == 'egzersiz') {
                            return GestureDetector(
                              child: workoutCard(
                                  data['egitim adı'],
                                  data['score'].toString(),
                                  data['RepNum'],
                                  data['SetNum'],
                                  data['egzersiz1'],
                                  data['egzersiz2'],
                                  data['egzersiz3'],
                                  context,
                                  'Egitimler',
                                  data.id,
                                  deviceSize),
                            );
                          }
                          return GestureDetector(
                            child: workoutCard(
                                data['egitim adı'],
                                data['score'].toString(),
                                data['RepNum'],
                                data['SetNum'],
                                data['egzersiz1'],
                                data['egzersiz2'],
                                data['egzersiz3'],
                                context,
                                'Egitimler',
                                data.id,
                                deviceSize),
                          );
                        });
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddEgitimScreen()));
        },
        child: Stack(
          children: <Widget>[
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.darkGreen,
              ),
            ),
            Center(
              child: Icon(
                Icons.add,
              ),
            ),
          ],
        ),
        //backgroundColor: Color(0xffdddddd),
      ),
    );
  }
}
