import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  String id;
  String name;
  String userid;
  String imagePath;
  Timestamp? createdTime;
  Timestamp? updateTime;
  Account(
      {required this.id,
      required this.name,
      required this.userid,
      required this.imagePath,
      this.createdTime,
      this.updateTime});
}
