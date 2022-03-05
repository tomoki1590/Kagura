import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sliver_appbar/provider.dart';

//riverpod
class AddTab extends ConsumerWidget {
  const AddTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getImage = ref.watch(getImageProvider);
    final getImageNotifier = ref.watch(getImageProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        actions: [ElevatedButton(onPressed: () {}, child: const Text('保存'))],
        title: const Text('写真'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
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
            const Text('神楽団名'),
            TextField(
              autofocus: true,
              onChanged: (homeName) {
                ref.watch(getHomeName);
              },
            ),
            Text('演目'),
            TextField(),
            Text('撮影場所など'),
            TextField(),
            getImage.imageFile == null
                ? const Padding(padding: EdgeInsets.all(8.0), child: Text(''))
                : Image.file(getImage.imageFile!),
            if (getImage.imageFile != null)
              //画像が表示された時に再度画像のとる　表示を変えるのに使用
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(' '),
              ),
          ],
        ),
      ),
    );
  }
}
