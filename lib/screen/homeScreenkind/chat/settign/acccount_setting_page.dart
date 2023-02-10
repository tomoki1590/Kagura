import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sliver_appbar/screen/homeScreenkind/account_tab.dart';
import 'package:sliver_appbar/utils/fanction.dart';

import '../../../../utils/account.dart';
import '../../../../utils/auth.dart';

class AccountSettingPage extends StatefulWidget {
  const AccountSettingPage({Key? key}) : super(key: key);

  @override
  State<AccountSettingPage> createState() => _AccountSettingPageState();
}

class _AccountSettingPageState extends State<AccountSettingPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController kaguraGroupController = TextEditingController();
  TextEditingController uidController = TextEditingController();
  File? image;

  @override
  Widget build(BuildContext context) {
    Account? myAccountPage = Authentication.myAccount;

    return Scaffold(
      appBar: AppBar(title: const Text('アカウント設定ペーシ')),
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
                radius: 50,
                foregroundImage: image == null ? null: FileImage(image!),
                child: const Icon(Icons.add),
              ),
            ),
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
                radius: 50,
                foregroundImage: NetworkImage(myAccountPage?.imagePath ??
                    "https://cdns.iconmonstr.com/wp-content/releases/preview/2018/240/iconmonstr-user-male-thin.png"),
              ),
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                initialValue: myAccountPage?.name,
                decoration: const InputDecoration(hintText: '名前'),
              ),
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                initialValue: myAccountPage?.kaguraGroup,
                decoration: const InputDecoration(hintText: '所属団体'),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AccountTab()));
                },
                child: const Text("保存")),
          ],
        ),
      ),
    );
  }
}
