import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliver_appbar/auth/login/login_page.dart';
import 'package:sliver_appbar/utils/auth.dart';

import 'singn_up _model.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignUpModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('新規登録'),
        ),
        body: Center(
          child: Consumer<SignUpModel>(builder: (context, model, child) {
            return Column(
              children: [
                // CircleAvatar(
                //   foregroundImage: image == null ? null : FileImage(image!),
                //   radius: 50,
                //   child: const Icon(Icons.add),
                // ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: null,
                    decoration: const InputDecoration(hintText: 'name'),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: null,
                    decoration: const InputDecoration(hintText: 'kaguraGroup'),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: model.mailAdress,
                    decoration: const InputDecoration(hintText: 'email'),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: model.passWord,
                    decoration: const InputDecoration(hintText: 'password'),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (model.mailAdress.text.isNotEmpty &&
                          model.passWord.text.isNotEmpty) {
                        var result = await Authentication.signUp(
                            email: model.mailAdress.text,
                            pass: model.passWord.text);
                        {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        }
                      }
                    },
                    child: const Text("新規アカウント作成")),
              ],
            );
          }),
        ),
      ),
    );
  }
}
