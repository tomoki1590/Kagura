import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';
import 'package:sliver_appbar/screen/provider/model.dart';

class LoginProvider extends StatelessWidget {
  const LoginProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>(
      create: (context) => MainModel(), //Modelの直下にConsumer
      child: Consumer<MainModel>(
          builder: (_, model, child) //(context, model, child)
              {
        return Scaffold(
          appBar: AppBar(
            title: Text('data'),
          ),
          body: Center(
            child: SignInButton(Buttons.Google, onPressed: () async {
              await model.signInWithGoogle();
            }),
          ),
        );
      }),
    );
  }
}
