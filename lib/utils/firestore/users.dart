import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sliver_appbar/utils/account.dart';
import 'package:sliver_appbar/utils/auth.dart';

class UserFireStore {
  static final firestoredata = FirebaseFirestore.instance;
  static final CollectionReference userdata =
      firestoredata.collection('userdata');

  static Future<dynamic> setUser(Account newAccount) async {
    try {
      await userdata.doc(newAccount.id).set({
        'name': newAccount.name,
        'userid': newAccount.userid,
        'imagePath': newAccount.imagePath,
        'createdTime': Timestamp.now(),
        'updateTime': Timestamp.now(),
      });
      print('user success Account');
      return true;
    } on FirebaseException catch (e) {
      print(' error:$e');
      return false;
    }
  }

  static Future<dynamic> getUser(String uid) async {
    try {
      DocumentSnapshot documentSnapshot = await userdata.doc(uid).get();
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      Account myAccount = Account(
        id: uid,
        name: data['name'],
        userid: data['userid'],
        imagePath: data['imagePath'],
        createdTime: data['createdTime'],
        updateTime: data['updataTime'],
      );
      //今新しく作ったmyAccountを前のものに代入
      Authentication.myAccount = myAccount;
      print('User Success');
      return true;
    } on FirebaseException catch (e) {
      print('User Eroor$e');
      return false;
    }
  }
}
