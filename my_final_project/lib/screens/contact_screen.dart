import 'package:flutter/material.dart';
import 'package:my_final_project/config/palette.dart';
import 'package:my_final_project/screens/auth/widgets/decoration_functions.dart';
import 'package:my_final_project/model/getContact.dart';


class contactPage extends StatefulWidget {
  const contactPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _contactPageState createState() => _contactPageState();
}

class _contactPageState extends State<contactPage> {
  TextEditingController _subjectController = new TextEditingController();
  TextEditingController _bodyController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.darkGreen,
        title: Padding(
          padding: const EdgeInsets.only(left: 75),
          child: Text('Bana Ulaşın'),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: Text(
                      'Uygulama hakkındaki tüm \ngörüşlerinizi yazabilirsiniz.',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 125),
                    child: Card(
                      color: Palette.opacityBlue,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                        child: Text('peker.saltuk66.sp@gmail.com',style: TextStyle(fontFamily: 'Roboto'),),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 380,
                    width: 420,
                    decoration: BoxDecoration(
                      color: Palette.opacityBlue,
                      borderRadius: BorderRadius.all(Radius.circular(38)),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            children: [
                              Container(
                                child: TextField(
                                  controller: _subjectController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Konu',
                                  ),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: TextField(
                                    controller: _bodyController,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 13,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Mesajınız...',
                                    ),
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: buildButton(
                      text: 'Gönder',
                      onClicked: () => Utils.openEmail(
                        toEmail: 'peker.saltuk66.sp@gmail.com',
                        subject: 'Merhabalar',
                        body: 'Uygulamanız harika !',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton({
    @required String text,
    @required VoidCallback onClicked,
  }) =>
      Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: RaisedButton(
          shape: StadiumBorder(),
          onPressed: onClicked,
          color: Palette.darkGreen,
          textColor: Colors.white,
          child: Text(
            text,
            style: TextStyle(fontSize: 25),
          ),
        ),
      );

//   sendMail() {
//     Utils.openEmail(
//         toEmail: 'peker.saltuk66.sp@gmail.com',
//         subject: _subjectController.text,
//         body: _bodyController.text);
//   }
}
