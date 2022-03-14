import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sliver_appbar/screen/account/login.dart';
import 'package:sliver_appbar/utils/account.dart';
import 'package:sliver_appbar/utils/auth.dart';
import 'package:sliver_appbar/utils/fanction.dart';
import 'package:sliver_appbar/utils/firestore/users.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController uidController = TextEditingController();
  File? image;

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
              onTap: () async {
                var result = await Fanction.getImageFromGallery();
                if (result != null) {
                  setState(() {
                    image = File(result.path);
                  });
                }
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
                      passwordController.text.isNotEmpty &&
                      image != null) {
                    var result = await Authentication.signUp(
                        email: emailController.text,
                        pass: passwordController.text);
                    if (result is UserCredential) {
                      String imagepath =
                          await Fanction.upLoadImage(result.user!.uid, image!);
                      Account newAccount = Account(
                        id: result.user!.uid,
                        name: nameController.text,
                        imagePath: imagepath,
                      );
                      var results = await UserFireStore.setUser(newAccount);
                      if (results == true) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      }
                    }
                  }
                },
                child: const Text("新規アカウント作成")),
          ],
        ),
      ),
    );
  }
}
