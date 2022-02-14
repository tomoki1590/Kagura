import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //２行目だけだとエラーになるので追加
  await Firebase.initializeApp(); // ここ大事！Firebase使うのに初期化しないとエラーになる
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // <- Debug の 表示を OFF
      title: "記事",
      home: Login(),
    );
  }
}
