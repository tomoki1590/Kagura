import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sliver_appbar/screen/homeScreenkind/chat/talk_page.dart';

import 'addd_chat_rooom.dart';

class ChatTab extends StatelessWidget {
  const ChatTab(document, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("グループリスト"),
      ),
      body: Column(
        children: [
          Text('data'),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('chat')
                .orderBy('createdAt')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                print('Eroor OK?');
                return Center(
                  child: const Text('何も取得できませんでした'),
                );
              }
              if (snapshot.hasData) {
                final List<DocumentSnapshot> documentations =
                    snapshot.data!.docs;
                return Flexible(
                  child: ListView(
                    children: documentations.map((document) {
                      return Column(
                        children: [
                          Card(
                            child: ListTile(
                              title: Text(document['name']),
                              trailing: IconButton(
                                icon: Icon(Icons.input),
                                onPressed: () async {
                                  await Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          TalkPage(document['name']),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                );
              }
              return const Center(child: Text('読み込み中'));
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            await Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddChatRoom()));
          }),
    );
  }
}
