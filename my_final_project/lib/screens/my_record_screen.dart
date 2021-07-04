import 'package:flutter/material.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 85),
            child: Text('Rekorlarım'),
          ),
        ),
      ),
    );
  }
}
