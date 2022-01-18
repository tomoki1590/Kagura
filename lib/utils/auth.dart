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
      return '登録エラー発生';
    }
  }
}
