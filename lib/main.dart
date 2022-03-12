import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliver_appbar/screen/kagura_add.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized(); //２行目だけだとエラーになるので追加
  // await Firebase.initializeApp(); // ここ大事！Firebase使うのに初期化しないとエラーになる
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // Debug の 表示を OFF
        title: "記事",
        home: KaguraAdd());
  }
}
