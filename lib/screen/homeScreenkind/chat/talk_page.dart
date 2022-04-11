import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TalkPage extends StatefulWidget {
  const TalkPage(documentList, {Key? key}) : super(key: key);

  @override
  State<TalkPage> createState() => _TalkPageState();
}

class _TalkPageState extends State<TalkPage> {
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('chat'),
      ),
      body: Container(child: const Text('chat'),
      ),
    );
  }
}
