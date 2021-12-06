import 'package:flutter/material.dart';
import 'package:sliver_appbar/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // <- Debug の 表示を OFF
      title: "記事",
      home: HomeScreen(),
    );
  }
}
