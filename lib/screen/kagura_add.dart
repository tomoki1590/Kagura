import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class KaguraAdd extends StatefulWidget {
  const KaguraAdd({Key? key}) : super(key: key);

  @override
  State<KaguraAdd> createState() => _KaguraAddState();
}

class _KaguraAddState extends State<KaguraAdd> {
  File? imageVideo;

  final ImagePicker picker = ImagePicker();
  List<XFile>? imageList = [];
  TextEditingController groupNameController = TextEditingController();
  TextEditingController performanceController = TextEditingController();
  TextEditingController areaController = TextEditingController();

  VideoPlayerController? _controller;

  void getImages() async {
    final List<XFile>? selectedImages = await picker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageList!.addAll(selectedImages);
    }
    setState(
      () {},
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
          title: const Text('写真などの追加画面'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                            title: const Text('保存しますか？'),
                            actions: [
                              TextButton(
                                  onPressed: () {

                                  }, child: const Text('yes')),
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('no'))
                            ]);
                      });
                },
                child: const Text('保存'))
          ],
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
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: performanceController,
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
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ElevatedButton(
                        child: const Icon(Icons.image),
                        onPressed: getImages,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                                height: 200,
                                width: 300,
                                child: GridView.builder(
                                    itemCount: imageList!.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Image.file(
                                          File(imageList![index].path));
                                    })),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        child: const Icon(Icons.movie),
                        onPressed: getVideo,
                      ),
                      SizedBox(
                          width: 200,
                          height: 300,
                          child: _controller == null
                              ? const Text('動画が選ばれていません')
                              : VideoPlayer(_controller!))
                    ],
                  ),
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                DottedBorder(
                  dashPattern: const [2, 1],
                  child: Container(
                    height: 100,
                    width: 100,
                    color: const Color(0xFFE7E7E7),
                  ),
                ),
                const Icon(Icons.camera_enhance, size: 30),
              ],
            ),
          ],
        )));
  }
}
