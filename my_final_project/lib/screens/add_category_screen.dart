import 'package:flutter/material.dart';
import 'package:my_final_project/config/palette.dart';

class addCategoryScreen extends StatefulWidget {
  const addCategoryScreen({Key key}) : super(key: key);

  @override
  _addCategoryScreenState createState() => _addCategoryScreenState();
}

class _addCategoryScreenState extends State<addCategoryScreen> {
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Container(child: Text('Başlık',style: TextStyle(fontWeight: FontWeight.bold),),),
                SizedBox(height: 15,),
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
                SizedBox(height: 15,),
                Container(child: Text('Açıklama',style: TextStyle(fontWeight: FontWeight.bold),),),
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
                SizedBox(height: 35,),
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
