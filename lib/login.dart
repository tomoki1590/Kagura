import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("入団"),
      ),
      body: Center(
        child: Column(
          children: [
            ///TODOログイン処理
            SignInButton(Buttons.Google,
                text: "Sign up with Google", onPressed: () {}),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SignInButton(
                Buttons.Apple,
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SignInButton(
                Buttons.Email,
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SignInButton(Buttons.Facebook, onPressed: () {}),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SignInButton(
                Buttons.Twitter,
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SignInButton(
                Buttons.Yahoo,
                onPressed: () {},
              ),
            ),
            const Text("初めての方はこちらから"),
            TextButton(
                onPressed: () {},

                ///TODOサインアップ処理
                child: Text("新規登録"))
          ],
        ),
      ),
    );
  }
}
