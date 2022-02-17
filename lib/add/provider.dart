// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:image_picker/image_picker.dart';
//
// ImagePicker picker = ImagePicker();
// Future<void> getImageFromGallery() async =>
//     pickedFile = await picker.getImage(source: ImageSource.gallery);
// if (pickedFile != null)=> image = File(pickedFile.path);
//
// final ImageAddProvider = StateProvider((ref) {
//   return ImagePicker();
// });

import 'dart:html';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

File? image;
ImagePicker picker = ImagePicker();
Future<void> getImageFromgarally() async {
  final pickedFile = await picker.getImage(source: ImageSource.gallery);
  final imageProvider = StateProvider((ref) {
    return ImagePicker();
  });
}
