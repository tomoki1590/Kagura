import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliver_appbar/auth/login/log_model.dart';
import 'package:sliver_appbar/screen/home_screen.dart';

import '../sign_up/sign_up_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>(
      create: (_) => LoginModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("入団"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Consumer<LoginModel>(builder: (context, model, child) {
              return Column(
                children: [
                  SizedBox(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: TextField(
                        controller: model.mailAdress,
                        decoration: const InputDecoration(hintText: "メールアドレス"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: model.passWord,
                      decoration: const InputDecoration(hintText: 'パスワード'),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        try {
                          await model.SingnUp();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        } catch (e) {
                          final snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(e.toString()),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                      child: const Text("新規登録")),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
