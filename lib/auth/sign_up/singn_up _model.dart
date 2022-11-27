import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpModel extends ChangeNotifier {
  final mailAdress = TextEditingController();
  final passWord = TextEditingController();
  String? mail;
  String? pass;

  void setMail(String mail) {
    this.mail = mail;
    notifyListeners();
  }

  void setPass(String pass) {
    this.pass = pass;
    notifyListeners();
  }

  Future SingnUp() async {
    mail = mailAdress.text;
    pass = passWord.text;

    if (mail != null && pass != null) {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: mail!, password: pass!);
      notifyListeners();
    }
  }
}
