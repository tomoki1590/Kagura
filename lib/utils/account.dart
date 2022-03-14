import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  String id;
  String name;
  String imagePath;
  Timestamp? createdTime;
  Timestamp? updateTime;
  Account(
      {required this.id,
      required this.name,
      required this.imagePath,
      this.createdTime,
      this.updateTime});
}
