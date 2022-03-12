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
  final picker = ImagePicker();
  VideoPlayerController? _controller;


  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
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
    final pickedVideo = await picker.getVideo(source: ImageSource.gallery);
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
      appBar: AppBar(title: Text('')),
      body: Container(
        width: MediaQuery.of(context).size.width,
height: MediaQuery.of(context).size.height,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ElevatedButton(
                  child: Icon(Icons.add),
                  onPressed: getImage,
                ),
                Container(
                  child: image == null
                      ? Text('No image selected.')
                      : Image.file(image!),
                ),
                ElevatedButton(
                  child: Icon(Icons.add),
                  onPressed: getVideo,
                ),
                 Container(
                   width: 300,
                   height:300,
                  child: _controller == null
                      ? Text('No image selected.')
                      :VideoPlayer(_controller!)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
