import 'package:flutter/material.dart';

class TalkPage extends StatefulWidget {
  const TalkPage(document, {Key? key}) : super(key: key);

  @override
  State<TalkPage> createState() => _TalkPageState();
}

class _TalkPageState extends State<TalkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('チャット'),
      ),
    );
  }
}
