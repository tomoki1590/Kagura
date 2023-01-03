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
      body: const Text('testdayo '),
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
