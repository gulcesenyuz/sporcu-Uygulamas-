import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:my_final_project/screens/auth/title.dart';
import 'package:my_final_project/screens/auth/widgets/decoration_functions.dart';
import 'title.dart';
import 'sign_in_up_bar.dart';

class Register extends StatelessWidget {
  const Register({Key key, this.onSignInPressed}) : super(key: key);

  final VoidCallback onSignInPressed;

  @override
  Widget build(BuildContext context) {
    final isSubmitting = context.isSubmitting();
    return SignInForm(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: LoginTitle(
                  title: 'Hesap\nOluştur',
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: EmailTextFormField(
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        decoration: registerInputDecoration(hintText: 'E-mail')),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: PasswordTextFormField(
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      decoration: registerInputDecoration(hintText: 'Şifre'),
                    ),
                  ),
                  SignUpBar(
                    label: 'Kayıt Ol',
                    isLoading: isSubmitting,
                    onPressed: () {
                      context.registerWithEmailAndPassword();
                    },
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        onSignInPressed?.call();
                      },
                      child: const Text(
                        'Oturum Aç',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
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