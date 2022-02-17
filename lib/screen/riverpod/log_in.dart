import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:sliver_appbar/utils/auth.dart';

import '../account/sign_up.dart';
import '../home_screen.dart';

class RiverPodLogin extends ConsumerWidget {
  RiverPodLogin({Key? key}) : super(key: key);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("入団"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: TextField(
                    controller: email,
                    decoration: const InputDecoration(hintText: "メールアドレス"),
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: password,
                  decoration: const InputDecoration(hintText: 'パスワード'),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    var result = await Authentication.emailSignIn(
                        email: email.text, pass: password.text);
                    if (result == true) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    }
                  },
                  child: const Text('Login')),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text("初めての方はこちらから"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },

                  ///TODOサインアップ処理
                  child: const Text("新規登録")),

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
            ],
          ),
        ),
      ),
    );
  }
}
