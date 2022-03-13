import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class KaguraAdd extends StatefulWidget {
  KaguraAdd({Key? key}) : super(key: key);

  @override
  State<KaguraAdd> createState() => _KaguraAddState();
}

class _KaguraAddState extends State<KaguraAdd> {
  File? imageVideo;
  File? image;
  File? images;

  final ImagePicker picker = ImagePicker();
  final ImagePicker pickers = ImagePicker();

  VideoPlayerController? _controller;

  Future getImages() async {
    final pickedFiles = await pickers.pickImage(source: ImageSource.gallery);
    setState(
      () {
        if (pickedFiles != null) {
          images = File(pickedFiles.path);
        } else {
          print('No ImagePath');
        }
      },
    );
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(
      () {
        if (pickedFile != null) {
          image = File(pickedFile.path);
        } else {
          print('No ImagePath');
        }
      },
    );
  }

  Future getVideo() async {
    final pickedVideo = await picker.pickVideo(source: ImageSource.gallery);
    _controller = VideoPlayerController.file(File(pickedVideo!.path));
    _controller!.initialize().then((_) {
      setState(() {
        _controller!.play();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('写真などの追加画面'),
        actions: [ElevatedButton(onPressed: () {}, child: Text('保存'))],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ElevatedButton(
                  child: Icon(Icons.image),
                  onPressed: getImage,
                ),
                ElevatedButton(
                  child: Icon(Icons.image),
                  onPressed: getImages,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 300,
                        width: 200,
                        child: image == null
                            ? Text('画像が選ばれておりません')
                            : Image.file(image!),
                      ),
                      Container(
                        height: 300,
                        width: 300,
                        child: images == null
                            ? Text('画像が選ばれておりません')
                            : Image.file(images!),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  child: Icon(Icons.movie),
                  onPressed: getVideo,
                ),
                Container(
                    width: 300,
                    height: 300,
                    child: _controller == null
                        ? Text('動画が選ばれていません')
                        : VideoPlayer(_controller!))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
