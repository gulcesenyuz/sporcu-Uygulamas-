import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:my_final_project/config/palette.dart';
import 'package:my_final_project/screens/today_page.dart';
import 'auth/auth.dart';
import 'package:my_final_project/screens/auth/NavBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  static MaterialPageRoute get route => MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text('Anasayfa'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              context.signOut();
              Navigator.of(context).push(AuthScreen.route);
            },
          ),
        ],
      ),
      body: todayPage(),
    );
  }
}
