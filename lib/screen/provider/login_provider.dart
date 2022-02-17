import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
            child: SignInButton(Buttons.Google, text: "Sign up with Google",
                onPressed: () {
              signInWithGoogle();
            }),
          ),
        );
      }),
    );
  }
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
