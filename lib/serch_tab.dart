import 'package:flutter/material.dart';

class SerchTab extends StatelessWidget {
  const SerchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("検索"),
      ),
      body: const Text("検索ページ"),
    );
  }
}
