import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sliver_appbar/screen/account/login.dart';
import 'package:sliver_appbar/screen/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //２行目だけだとエラーになるので追加
  await Firebase.initializeApp(); // ここ大事！Firebase使うのに初期化しないとエラーになる
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) => MaterialApp(
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return  HomeScreen();
            }
            return  Login();
          }));
}
