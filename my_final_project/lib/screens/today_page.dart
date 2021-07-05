import 'package:flutter/material.dart';
import 'package:my_final_project/config/palette.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({Key key}) : super(key: key);

  @override
  _TodayPageState createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 500,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/fitnessBackground.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 115, left: 38),
                    child: Text(
                      "Ana Aktiviteler",
                      style: TextStyle(
                        color: Palette.darkOrange,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                // Container(
                //   height: 105,
                //   margin: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     children: [
                //       demoCategories("images/training_one.png", "Eğitimlerim ?"),
                //       SizedBox(width: 15),
                //       demoCategories("images/question_mark.png", "Egzersiz"),
                //       SizedBox(width: 15),
                //       demoCategories("images/question_mark.png", "Rekorlarım"),
                //       SizedBox(width: 15),
                //       demoCategories("images/question_mark.png", "BMI"),
                //       SizedBox(width: 15),
                //       demoCategories("images/question_mark.png", "Ayarlar"),
                //       SizedBox(width: 15),
                //       demoCategories("images/question_mark.png", "Destek"),
                //     ],
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 30),
                  child: Text(
                    "Günlük Aktiviteler",
                    style: TextStyle(
                      color: Palette.darkOrange,
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  child: Container(
                    width: double.infinity,
                    height: 175,
                    child: Center(
                      child: Text(
                        'Ooppps Aktivite Kaydı Bulunamadı.',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 30),
                  child: Text(
                    "Geçmiş Aktiviteler",
                    style: TextStyle(
                      color: Palette.darkOrange,
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  child: Container(
                    width: double.infinity,
                    height: 175,
                    child: Center(
                      child: Text(
                        'Ooppps Aktivite Kaydı Bulunamadı.',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget demoCategories(String image, String name) {
//   return Container(
//     width: 100,
//     decoration: BoxDecoration(
//       color: Palette.lightBlue,
//       borderRadius: BorderRadius.circular(10),
//     ),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       // crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           child: Image.asset(image),
//         ),
//         SizedBox(height: 10),
//         Container(
//           child: Center(
//             child: Text(
//               name,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 13,
//                 fontFamily: 'Roboto',
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
