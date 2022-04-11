import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sliver_appbar/screen/homeScreenkind/chat/chat_tab.dart';

class AddChatRoom extends StatefulWidget {
  const AddChatRoom({Key? key}) : super(key: key);

  @override
  State<AddChatRoom> createState() => _AddChatRoomState();
}

class _AddChatRoomState extends State<AddChatRoom> {
  String roomName = 'hello AREYOU OK';

  TextEditingController chatGroup = TextEditingController();

  TextEditingController chatNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('トークを始めよう'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  decoration: const
                      InputDecoration(hintText: ('参加するグループを入力してください')),
                  controller: chatGroup,
                 
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>const ChatTab(['name'])));
                },
                child:const Text('参加'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration:const
                        InputDecoration(hintText: ('作成するグループIdを入力してください')),
                    controller: chatNumber,
                     onChanged: (String value) {
                    setState(() {
                      roomName = value;
                    });
                  },
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final date = DateTime.now().toLocal().toIso8601String();
                    await FirebaseFirestore.instance
                        .collection('chat')
                        .doc(roomName)
                        .set({
                      'name': roomName,
                      'createdAt': date,
                    });
                     Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>const ChatTab(['name'])));
                  },
                  child:const Text('作成'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
