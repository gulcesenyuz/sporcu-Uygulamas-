import 'package:flutter/material.dart';
import 'package:my_final_project/config/palette.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String languageChoose;
  List _languageItem = ["   Türkçe"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.darkOrange,
          title: Text('Ayarlar'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Container(
              child: Text(
                'Dil Seçiniz',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButton(
                  hint: Text("     Dil Seçin."),
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  isExpanded: true,
                  underline: SizedBox(),
                  value: languageChoose,
                  onChanged: (newValue) {
                    setState(() {
                      languageChoose = newValue;
                    });
                  },
                  items: _languageItem.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Not: Uygulama şu anda sadece Türkçe dilini desteklemektedir.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 55,
            ),
            Container(
              child: Center(
                child: Text(
                  'Uygulama Hakkında',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Card(
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text('Uygulama version: v1.0'),
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Card(
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text('Geliştirici: karaHan'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
