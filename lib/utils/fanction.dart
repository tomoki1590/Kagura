// ignore_for_file: avoid_print

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class Fanction {
  static Future<dynamic> getImageFromGallery() async {
    ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return pickedFile;
  }

  static Future<String> upLoadImage(String uid, File image) async {
    final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    final Reference reference = firebaseStorage.ref();

    await reference.child(uid).putFile(image);
    //先ほどアップロードした画像のリンクを取得。
    String downloadUrl = await firebaseStorage.ref(uid).getDownloadURL();
    print('imagePath : $downloadUrl');
    return downloadUrl;
  }
}
