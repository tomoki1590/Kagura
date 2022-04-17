

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliver_appbar/screen/home_screen.dart';

import 'screen/account/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //２行目だけだとエラーになるので追加
  await Firebase.initializeApp(); // ここ大事！Firebase使うのに初期化しないとエラーになる
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox();
            }
            if (snapshot.hasData) {
              return const HomeScreen();
            }
            return const Login();
          }));
}
