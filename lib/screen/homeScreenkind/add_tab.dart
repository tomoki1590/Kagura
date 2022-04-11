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

    TextEditingController groupNameController = TextEditingController();
    TextEditingController perfomanceController = TextEditingController();
    TextEditingController areaController = TextEditingController();

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
                width: 300,
                child: Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: groupNameController,
                      decoration: const InputDecoration(hintText: '神楽団名'),
                      autofocus: true,
                      onChanged: (homeName) {
                        ref.watch(getHomeName);
                      },
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: perfomanceController,
                      decoration: const InputDecoration(hintText: '演目'),
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: areaController,
                      decoration: const InputDecoration(hintText: '撮影場所など'),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          final pickedFile = await picker.pickImage(
                              source: ImageSource.gallery);

                          if (pickedFile != null) {
                            getImageNotifier
                                .setImageFile(File(pickedFile.path));
                          }
                        },
                        child: const Icon(Icons.photo),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final pickedFile = await picker.pickVideo(
                              source: ImageSource.gallery);
                          if (pickedFile != null) {
                            getImageNotifier
                                .setImageFile(File(pickedFile.path));
                          }
                        },
                        child: const Icon(Icons.movie),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            getImage.imageFile == null
                ? const Padding(padding: EdgeInsets.all(8.0), child: Text(''))
                : Image.file(getImage.imageFile!),
            if (getImage.imageFile != null)
              const Padding(
                padding: EdgeInsets.all(10.0),
              ),
            //画像が表示された時に再度画像のとる　表示を変えるのに使用
          ],
        ),
      ),
    );
  }
}
