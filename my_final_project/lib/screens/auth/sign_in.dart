import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:my_final_project/config/palette.dart';
import 'package:my_final_project/screens/auth/sign_in_up_bar.dart';
import 'package:my_final_project/screens/auth/title.dart';
import 'package:my_final_project/screens/auth/widgets/decoration_functions.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key key, @required this.onRegisterClicked}) : super(key: key);

  final VoidCallback onRegisterClicked;

  @override
  Widget build(BuildContext context) {
    final isSubmitting = context.isSubmitting();
    return SignInForm(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: LoginTitle(
                  title: 'Tekrar\nHoşgeldin',
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: EmailTextFormField(
                      decoration: signInInputDecoration(hintText: 'E-mail'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: PasswordTextFormField(
                      decoration: signInInputDecoration(hintText: 'Şifre'),
                    ),
                  ),
                  SignInBar(
                    isLoading: isSubmitting,
                    label: 'Oturum Aç',
                    onPressed: () {
                      context.signInWithEmailAndPassword();
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        onRegisterClicked?.call();
                      },
                      child: RichText(
                        text: const TextSpan(
                          text: "Hesabın yok mu ?",
                          style: TextStyle(color: Colors.black54),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' KAYIT OL',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),
                            )
                          ]
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
