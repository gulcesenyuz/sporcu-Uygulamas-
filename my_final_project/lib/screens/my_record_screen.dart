import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_final_project/widgets/workout-card.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({Key key}) : super(key: key);

  @override
  _RecordScreenState createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 85),
          child: Text('Rekorlarım'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                    .limit(3)
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
                        final DocumentSnapshot data = snapshot.data.docs[index];
                        print(data.data());
                        if (data['created'].toDate() == null)
                          Center(child: CircularProgressIndicator());
                        return scoreCard(
                          data['created'].toDate(),
                          data['egitim adı'],
                          data['score'].toString(),
                          data['RepNum'],
                          data['SetNum'],
                          data['egzersiz1'],
                          data['egzersiz2'],
                          data['egzersiz3'],
                          deviceSize,
                        );
                      });
                },
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
