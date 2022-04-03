import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sliver_appbar/screen/homeScreenkind/chat/chat_tab.dart';

class AddChatRoom extends StatefulWidget {
  const AddChatRoom({Key? key}) : super(key: key);

  @override
  State<AddChatRoom> createState() => _AddChatRoomState();
}

class _AddChatRoomState extends State<AddChatRoom> {
  String roomName = 'hello';

  TextEditingController chatGroup = TextEditingController();

  TextEditingController chatNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('トークを始めよう'),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration:
                        InputDecoration(hintText: ('作成するグループを入力してください')),
                    controller: chatGroup,
                    onChanged: (String value) {
                      setState(() {
                        roomName = value;
                      });
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatTab(['name'])));
                  },
                  child: Text('作成'),
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
                      decoration:
                          InputDecoration(hintText: ('参加するグループIdを入力してください')),
                      controller: chatNumber,
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
                    },
                    child: Text('参加'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
