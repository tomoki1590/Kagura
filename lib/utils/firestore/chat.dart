import 'package:cloud_firestore/cloud_firestore.dart';

class ChatFire {
  static final firebaseChat = FirebaseFirestore.instance;
  static final CollectionReference chat = firebaseChat.collection('chat');
}
