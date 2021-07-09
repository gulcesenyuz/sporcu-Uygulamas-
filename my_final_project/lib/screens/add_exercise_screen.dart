import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_final_project/config/palette.dart';

class AddExerciseScreen extends StatefulWidget {
  const AddExerciseScreen({Key key}) : super(key: key);

  @override
  _AddExerciseScreenState createState() => _AddExerciseScreenState();
}

class _AddExerciseScreenState extends State<AddExerciseScreen> {
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();
  TextEditingController _metodController = new TextEditingController();
  TextEditingController _howController = new TextEditingController();
  final databaseReference = FirebaseFirestore.instance;
  final firebaseUser = FirebaseAuth.instance.currentUser;
  String valueChoose;
  String _category = "";

  _emptyQ(BuildContext context) {
    // flutter defined function
    return showDialog(
      barrierColor: Color(0xff000000).withOpacity(0.7),
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          backgroundColor: Colors.white.withOpacity(1),
          title: new Text(
            "Error",
            style: TextStyle(
                fontSize: 16,
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.w600),
          ),
          content: new Text(
            "Başlık adını giriniz",
            style: TextStyle(
                fontSize: 14,
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.w400),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text(
                "Kapat",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.8),
                    fontWeight: FontWeight.w600),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    'Başlık',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  child: Container(
                    child: TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                        hintText: ' Örn: Barfiks',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: Text(
                    'Kategori',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('Categories')
                          .snapshots(),
                      builder: (context, AsyncSnapshot snapshot) {
                        print(snapshot.hasData);
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return new CircularProgressIndicator();
                        } else {
                          if (snapshot.hasError) {
                            return new Text("fetch error");
                          } else {
                            return DropdownButtonHideUnderline(
                              child: new DropdownButton<dynamic>(
                                isExpanded: true,
                                hint: Row(
                                  children: [
                                    Container(
                                      width: 150, //and here
                                      child: Text(
                                        _category,
                                        style: TextStyle(color: Colors.grey),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ],
                                ),
                                onChanged: (dynamic newValue) {
                                  setState(() {
                                    _category = newValue;
                                  });
                                },
                                items: snapshot.data.documents
                                    .map<DropdownMenuItem<dynamic>>((document) {
                                  print("ghhgchg");
                                  print(document.data());
                                  return new DropdownMenuItem(
                                      value: document.data()['category name'],
                                      child: new Container(
                                        height: 50.0,
                                        padding: EdgeInsets.fromLTRB(
                                            10.0, 0.0, 0.0, 0.0),
                                        //color: primaryColor,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: new Text(
                                            document.data()['category name'],
                                            style: TextStyle(
                                                inherit: true,
                                                color: Colors.black
                                                    .withOpacity(0.6)),
                                          ),
                                        ),
                                      ));
                                }).toList(),
                              ),
                            );
                          }
                        }
                      }),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: Text(
                    'Açıklama',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    child: TextField(
                      controller: _descriptionController,
                      maxLines: 7,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                        hintText: ' Bu egzersiz ne için ?',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    child: TextField(
                      controller: _metodController,
                      maxLines: 7,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                        hintText: ' Metod',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    child: TextField(
                      controller: _howController,
                      maxLines: 7,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                        hintText: ' Bu egzersiz nasıl yapılır ?',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Palette.darkGreen, shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: IconButton(
                        padding: EdgeInsets.all(12),
                        icon: Icon(
                          Icons.send_outlined,
                          color: Colors.white,
                          size: 22,
                        ),
                        onPressed: () async {
                          if (_titleController.text.isEmpty) {
                            _emptyQ(context);
                          } else {
                            final categoriID =
                                databaseReference.collection('Exercices').doc();
                            categoriID.set({
                              'exercice name': _titleController.text,
                              'category': _category,
                              'exercice description':
                                  _descriptionController.text,
                              'nasıl yapılır': _howController.text,
                              'method': _metodController.text,
                              'hesap sahibi': firebaseUser.uid,
                              'created': FieldValue.serverTimestamp(),
                            });
                            Navigator.pop(context);
                            _titleController.clear();
                            _descriptionController.clear();
                            _metodController.clear();
                          }
                          CircularProgressIndicator();
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
