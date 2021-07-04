import 'package:flutter/material.dart';

class workoutsCard extends StatelessWidget {
  const workoutsCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 85),
          child: Text('Eğitimlerim'),
        ),
      ),
      
    );
  }
}
