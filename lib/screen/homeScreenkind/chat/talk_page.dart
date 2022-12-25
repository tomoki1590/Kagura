import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

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
       body:Container(child: Text('testdayo '),
       ),
        // Chat(
      //   theme:  const DefaultChatTheme(
      //     inputBackgroundColor: Colors.blue,
      //     sendButtonIcon: Icon(Icons.send),
      //     sendingIcon: Icon(Icons.update_outlined),
      //   ),
      //   showUserNames: true,
      //   // メッセージの配列
      //   messages: ,
      //   onPreviewDataFetched: ,
      //   onSendPressed: ,
      //   user: ,
      // ),
    );
  }
}
