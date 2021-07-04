import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_final_project/config/palette.dart';
import 'package:my_final_project/screens/add_category_screen.dart';

class addExerciseScreen extends StatefulWidget {
  const addExerciseScreen({Key key}) : super(key: key);

  @override
  _addExerciseScreenState createState() => _addExerciseScreenState();
}

class _addExerciseScreenState extends State<addExerciseScreen> {
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();
  TextEditingController _methodController = new TextEditingController();

  String valueChoose;
  List listItem = ["...", "yeni kategori ekle"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    'Başlık',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Card(
                  child: Container(
                    child: TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: ' Örn: Barfiks',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Text(
                    'Kategori',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton(
                    hint: Text("Kategori Seçin."),
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    underline: SizedBox(),
                    value: valueChoose,
                    onChanged: (newValue) {
                      setState(() {
                        valueChoose = newValue;
                      });
                    },
                    items: listItem.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
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
                        hintText: ' Bu egzersiz ne için ?',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Text(
                    'Metod',
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
                        hintText: ' Bu egzersiz nasıl yapılır ?',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                FloatingActionButton(
                  // onPressed: ,
                  backgroundColor: Palette.darkGreen,
                  tooltip: 'Increment',
                  child: Icon(Icons.check),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
