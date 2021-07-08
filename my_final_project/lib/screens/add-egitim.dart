import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_final_project/config/palette.dart';

class AddEgitimScreen extends StatefulWidget {
  const AddEgitimScreen({Key key}) : super(key: key);

  @override
  _AddEgitimScreenState createState() => _AddEgitimScreenState();
}

class _AddEgitimScreenState extends State<AddEgitimScreen> {
  TextEditingController _setController = new TextEditingController();
  TextEditingController _repController = new TextEditingController();
  TextEditingController _metodController = new TextEditingController();
  TextEditingController _howController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  final databaseReference = FirebaseFirestore.instance;
  final firebaseUser = FirebaseAuth.instance.currentUser;
  String valueChoose;
  String _category = "categori1";
  String _ex1 = "egzersiz";
  String _ex2 = "egzersiz";
  String _ex3 = "egzersiz";
  int x, y;
  var score;

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
            "Boşukları doldurun",
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
                    'Eğitim Adı',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  child: Container(
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                        hintText: 'eğitim',
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    'Set Sayısı',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  child: Container(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _setController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                        hintText: ' Örn: 3',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    'Tekrar Sayısı',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  child: Container(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _repController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                        hintText: ' Örn: 3',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: Text(
                    'Hangi Kategoride Çalışacaksın?',
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
                                  return new DropdownMenuItem(
                                      value: document.data()['category name'],
                                      child: new Container(
                                        height: 100.0,
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
                    'Hangi Egzersizleri Ekleyeceksin?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('Exercices')
                          .where('category', isEqualTo: _category)
                          .snapshots(),
                      builder: (context, AsyncSnapshot snapshot) {
                        print(_category);
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return new CircularProgressIndicator();
                        } else {
                          if (snapshot.hasError) {
                            return new Text("fetch error");
                          } else {
                            print("else");
                            print(snapshot.data.documents);

                            return DropdownButtonHideUnderline(
                              child: new DropdownButton<dynamic>(
                                isExpanded: true,
                                hint: Container(
                                  width: 150, //and here
                                  child: Text(
                                    _ex1,
                                    style: TextStyle(color: Colors.grey),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                onChanged: (dynamic val) {
                                  setState(() {
                                    _ex1 = val;
                                    print("_ex");

                                    print(_ex1);
                                  });
                                },
                                items: snapshot.data.documents
                                    .map<DropdownMenuItem<dynamic>>((document) {
                                  print("heelo");
                                  return new DropdownMenuItem(
                                      value: document.data()['exercice name'],
                                      child: new Container(
                                        height: 100.0,
                                        padding: EdgeInsets.fromLTRB(
                                            10.0, 0.0, 0.0, 0.0),
                                        //color: primaryColor,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: new Text(
                                            document.data()['exercice name'],
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
                Card(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('Exercices')
                          .where('category', isEqualTo: _category)
                          .snapshots(),
                      builder: (context, AsyncSnapshot snapshot) {
                        print(_category);
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return new CircularProgressIndicator();
                        } else {
                          if (snapshot.hasError) {
                            return new Text("fetch error");
                          } else {
                            print("else");
                            print(snapshot.data.documents);

                            return DropdownButtonHideUnderline(
                              child: new DropdownButton<dynamic>(
                                isExpanded: true,
                                hint: Container(
                                  width: 150, //and here
                                  child: Text(
                                    _ex2,
                                    style: TextStyle(color: Colors.grey),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                onChanged: (dynamic val) {
                                  setState(() {
                                    _ex2 = val;
                                    print("_ex");

                                    print(_ex2);
                                  });
                                },
                                items: snapshot.data.documents
                                    .map<DropdownMenuItem<dynamic>>((document) {
                                  print("heelo");
                                  return new DropdownMenuItem(
                                      value: document.data()['exercice name'],
                                      child: new Container(
                                        height: 100.0,
                                        padding: EdgeInsets.fromLTRB(
                                            10.0, 0.0, 0.0, 0.0),
                                        //color: primaryColor,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: new Text(
                                            document.data()['exercice name'],
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
                Card(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('Exercices')
                          .where('category', isEqualTo: _category)
                          .snapshots(),
                      builder: (context, AsyncSnapshot snapshot) {
                        print(_category);
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return new CircularProgressIndicator();
                        } else {
                          if (snapshot.hasError) {
                            return new Text("fetch error");
                          } else {
                            print("else");
                            print(snapshot.data.documents);

                            return DropdownButtonHideUnderline(
                              child: new DropdownButton<dynamic>(
                                isExpanded: true,
                                hint: Container(
                                  width: 150, //and here
                                  child: Text(
                                    _ex3,
                                    style: TextStyle(color: Colors.grey),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                onChanged: (dynamic val) {
                                  setState(() {
                                    _ex3 = val;
                                    print("_ex");

                                    print(_ex3);
                                  });
                                },
                                items: snapshot.data.documents
                                    .map<DropdownMenuItem<dynamic>>((document) {
                                  return new DropdownMenuItem(
                                      value: document.data()['exercice name'],
                                      child: new Container(
                                        height: 100.0,
                                        padding: EdgeInsets.fromLTRB(
                                            10.0, 0.0, 0.0, 0.0),
                                        //color: primaryColor,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: new Text(
                                            document.data()['exercice name'],
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
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.orange,
                  ),
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Score: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      (_repController.text != "" &&
                              _repController.text != "" &&
                              _nameController.text != "")
                          ? Text(
                              score = (int.parse(_repController.text) *
                                      int.parse(_setController.text))
                                  .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            )
                          : Text("0")
                    ],
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
                          if (_setController.text.isEmpty &&
                              _repController.text.isEmpty) {
                            _emptyQ(context);
                          } else {
                            final categoriID =
                                databaseReference.collection('Egitimler').doc();
                            categoriID.set({
                              "egitim adı": _nameController.text,
                              'SetNum': _setController.text,
                              'RepNum': _repController.text,
                              'category': _category,
                              'egzersiz1': _ex1,
                              'egzersiz2': _ex2,
                              'egzersiz3': _ex3,
                              'hesap sahibi': firebaseUser.uid,
                              "score": score,
                              'created': FieldValue.serverTimestamp(),
                            });
                            Navigator.pop(context);
                            _setController.clear();
                            _repController.clear();
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
