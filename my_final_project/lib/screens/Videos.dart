import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_final_project/database/upload.dart';

class Videos extends StatefulWidget {
  String exName;

  Videos({this.exName});
  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  TextEditingController customController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 85),
          child: Text('Rekorlarım'),
        ),
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

                  return Container(
                    child: Text(data['dataUrl']),
                  );
                });
          },
        ),
      ),
    );
  }
}
