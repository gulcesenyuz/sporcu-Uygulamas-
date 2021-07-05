import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_final_project/config/palette.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({Key key}) : super(key: key);

  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();
  final databaseReference = FirebaseFirestore.instance;
  final firebaseUser = FirebaseAuth.instance.currentUser;

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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Container(
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
                        border: InputBorder.none,
                        hintText: ' Örn: Omuz',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Text(
                    'Açıklama',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Card(
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    child: TextField(
                      controller: _descriptionController,
                      maxLines: 7,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: ' Bu kategoriyi açıklayın.',
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
                          color: Colors.black.withOpacity(0.6),
                        ),
                        onPressed: () async {
                          if (_titleController.text.isEmpty) {
                            _emptyQ(context);
                          } else {
                            final categoriID = databaseReference
                                .collection('Categories')
                                .doc();
                            categoriID.set({
                              'category name': _titleController.text,
                              'category description':
                                  _descriptionController.text,
                              'hesap sahibi': firebaseUser.uid,
                              'created': FieldValue.serverTimestamp(),
                            });
                            Navigator.pop(context);
                            _titleController.clear();
                            _descriptionController.clear();
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
