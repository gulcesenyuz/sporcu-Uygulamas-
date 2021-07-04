import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_final_project/config/palette.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:my_final_project/screens/bmi_calculator_screen.dart';
import 'package:my_final_project/screens/calendar.dart';
import 'package:my_final_project/screens/contact_screen.dart';
import 'package:my_final_project/screens/my_exercise_screen.dart';
import 'package:my_final_project/screens/my_record_screen.dart';
import 'package:my_final_project/screens/my_workouts.dart';
import 'package:my_final_project/screens/nedir.dart';
import 'package:my_final_project/screens/setting_screen.dart';


class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Test User',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            accountEmail: Text(
              'test@test.com',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://www.pngitem.com/pimgs/m/108-1083736_transparent-discord-icon-png-discord-profile-png-download.png',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Palette.lightBlue,
              image: DecorationImage(
                image: NetworkImage(
                  'https://anemurionhotel.com.tr/wp-content/uploads/2016/05/Abstract-Wallpaper-HD-19-1.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text(
              'Nedir ?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => nedirPage(),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.web_sharp),
            title: Text(
              'Eğitimlerim',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => workoutsCard())),
          ),
          ListTile(
            leading: Icon(Icons.directions_run),
            title: Text(
              'Egzersiz',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => myExerciseScreen())),
          ),
          ListTile(
            leading: Icon(Icons.beenhere),
            title: Text('Rekorlarım',
                style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => RecordScreen())),
          ),
          ListTile(
            leading: Icon(Icons.straighten),
            title: Text('BMI', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => bmiCalculator())),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today_rounded),
            title: Text(
              'Takvim',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => calendarScreen())),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title:
                Text('Ayarlar', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen())),
          ),
          ListTile(
            leading: Icon(Icons.assistant_photo),
            title:
                Text('Destek', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => contactPage())),
          ),
        ],
      ),
    );
  }
}
