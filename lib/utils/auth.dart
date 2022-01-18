import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static User? currentUser;

  static Future<dynamic> signUp(
      {required String email, required String pass}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: pass);
      print('auth rezistor ok');
      return true;
    } on FirebaseAuthException catch (e) {
      print('auth rezistor $e');
      return false;
    }
  }

  static Future<dynamic> emailSignIn(
      {required String email, required String pass}) async {
    final UserCredential _result = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: pass);
    try {
      currentUser = _result.user;
      print('login finished');
      return true;
    } on FirebaseAuthException catch (e) {
      print('auth lost,$e');
      return false;
    }
  }
}
