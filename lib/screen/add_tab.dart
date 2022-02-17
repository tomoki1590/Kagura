import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sliver_appbar/add/get_image.dart';
import 'package:sliver_appbar/add/get_image_notifier.dart';

//riverpod
final getImageProvider = StateNotifierProvider<GetImageNotifier, GetImage>(
    (ref) => GetImageNotifier(ref.read));

class AddTab extends ConsumerWidget {
  AddTab({Key? key}) : super(key: key);
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getImage = ref.watch(getImageProvider);
    final getImageNotifier = ref.watch(getImageProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('写真の追加ができるよー'),
      ),
      body: Column(
        children: [
          getImage.imageFile == null
              ? Padding(padding: const EdgeInsets.all(8.0), child: Text(''))
              : Image.file(getImage.imageFile!),
          if (getImage.imageFile != null)
            //画像が表示された時に再度画像のとる　表示を変えるのに使用
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(' '),
            ),
          Center(
            child: SizedBox(
              width: 300,
              height: 300,
              child: OutlinedButton(
                onPressed: () async {
                  final pickedFile =
                      await picker.getImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    getImageNotifier.setImageFile(File(pickedFile.path));
                  }
                },
                child: Icon(Icons.photo),
              ),
            ),
          ),
          Text('神楽団名'),
          TextField(),
          Text('演目'),
          TextField(),
          Text('撮影場所など'),
          TextField(),
        ],
      ),
    );
  }
}
