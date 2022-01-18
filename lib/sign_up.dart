import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sliver_appbar/utils/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  File? image;
  ImagePicker picker = ImagePicker();
  Future<void> getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規登録'),
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                getImageFromGallery();
              },
              child: CircleAvatar(
                foregroundImage: image == null ? null : FileImage(image!),
                radius: 50,
                child: const Icon(Icons.add),
              ),
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: 'name'),
              ),
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(hintText: 'email'),
              ),
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(hintText: 'password'),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (nameController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    var result = await Authentication.signUp(
                        email: emailController.text,
                        pass: passwordController.text);
                    if (result == true) {
                      Navigator.pop(context);
                    }
                  }
                },
                child: const Text("新規アカウント作成"))
          ],
        ),
      ),
    );
  }
}
